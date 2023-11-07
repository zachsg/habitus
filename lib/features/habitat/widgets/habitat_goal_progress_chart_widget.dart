import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobn/helpers/extensions.dart';

import '../../../models/xmodels.dart';
import '../habitat.dart';

class HabitatGoalProgressChartWidget extends ConsumerWidget {
  const HabitatGoalProgressChartWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIOS = Platform.isIOS;

    final profiles = ref.watch(habitatProvider(habitat)).profiles;
    final actions = ref.watch(habitatProvider(habitat)).actions;

    int total = 0;
    int accomplished = 0;
    int remaining = 0;
    bool goalMet = false;

    for (final profile in profiles) {
      final goal =
          profile.goals.firstWhere((goal) => goal.habitatId == habitat.id);
      total += goal.value;
    }

    for (final action in actions) {
      accomplished += action.goal.value;
    }

    if (accomplished >= total) {
      goalMet = true;
    } else {
      remaining = total - accomplished;
    }

    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            child: goalMet
                ? Icon(
                    isIOS ? CupertinoIcons.star_fill : Icons.star,
                    size: 80.0,
                    color: Colors.yellow.shade800,
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        remaining.toTimeShort(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Remaining',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
          ),
        ),
        AspectRatio(
          aspectRatio: 1.3,
          child: AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {},
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 58,
                sections: showingSections(
                  context: context,
                  ref: ref,
                  habitat: habitat,
                  goal: habitat.teamGoal.toDouble(),
                  profiles: profiles,
                  actions: actions,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections({
    required BuildContext context,
    required WidgetRef ref,
    required HUHabitatModel habitat,
    required double goal,
    required List<HUProfileModel> profiles,
    required List<HUActionModel> actions,
  }) {
    final List<PieChartSectionData> pie = [];
    int count = 0;
    double total = 0;
    double percentage = 0;
    double cumulativePercentage = 0;
    String avatar = '';

    for (var action in actions) {
      total += action.goal.value;
    }

    for (final profile in profiles) {
      double value = 0.0;
      for (final action in actions) {
        if (action.ownerId == profile.id) {
          value += action.goal.value;
        }
      }

      percentage = value / goal * 100;
      cumulativePercentage += percentage.round();

      final isSvg = avatar.isEmpty ? false : true;
      if (profile.avatar.isNotEmpty) {
        avatar = profile.avatar;
      } else {
        final nameArray = profile.name.split(' ');
        for (final name in nameArray) {
          avatar += name[0].toUpperCase();
        }
      }

      if (percentage != 0) {
        pie.add(
          pieChartSectionData(
            context: context,
            value: value,
            percentage: percentage,
            color: count.toColor(),
            avatar: avatar,
            isSvg: isSvg,
          ),
        );
      }

      avatar = '';
      count++;
    }

    if (cumulativePercentage < 100) {
      pie.add(
        pieChartSectionData(
          context: context,
          value: goal - total,
          percentage: 100 - cumulativePercentage,
          color: 11.toColor(),
          avatar: '',
          isSvg: true,
        ),
      );
    }

    return pie;
  }

  PieChartSectionData pieChartSectionData({
    required BuildContext context,
    required double value,
    required double percentage,
    required Color color,
    required bool isSvg,
    String avatar = '',
  }) {
    return PieChartSectionData(
      color: color,
      value: value,
      title: '', //percentage == 100 ? '0%' : '${percentage.round()}%',
      radius: 84.0,
      titleStyle: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(fontWeight: FontWeight.bold),
      badgeWidget: avatar.isNotEmpty
          ? _Badge(
              context,
              avatar,
              size: 48.0,
              borderColor: color,
              isSvg: isSvg,
            )
          : const SizedBox(),
      badgePositionPercentageOffset: .98,
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    BuildContext context,
    this.svgAsset, {
    required this.size,
    required this.borderColor,
    required this.isSvg,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;
  final bool isSvg;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: isSvg
            ? SvgPicture.asset(svgAsset)
            : Text(
                svgAsset,
                style: Theme.of(context).textTheme.titleMedium,
              ),
      ),
    );
  }
}
