import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../helpers/app_colors.dart';

class PieChartSample3 extends StatefulWidget {
  const PieChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => PieChartSample3State();
}

class PieChartSample3State extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: showingSections(
                context: context, goal: 100, avatar: 'images/habitus_logo.svg'),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections({
    required BuildContext context,
    required double goal,
    String avatar = 'images/habitus_logo.svg',
  }) {
    // TODO: replace 'list' with list of 'profiles + progress towards goals'
    List<int> list = [10, 15, 30, 20];
    final List<PieChartSectionData> pie = [];
    int count = 0;
    double total = 0;

    for (var element in list) {
      total += element;
    }

    list.add(0);

    for (final i in list) {
      double value = i.toDouble();
      final Color color;

      if (count == list.length - 1) {
        count = 10;
        value = goal - total;
        avatar = '';
      }

      switch (count) {
        case 0:
          color = AppColors.one;
        case 1:
          color = AppColors.two;
        case 2:
          color = AppColors.three;
        case 3:
          color = AppColors.four;
        case 4:
          color = AppColors.five;
        case 5:
          color = AppColors.six;
        case 6:
          color = AppColors.seven;
        case 7:
          color = AppColors.eight;
        case 8:
          color = AppColors.nine;
        case 9:
          color = AppColors.ten;
        default:
          color = Theme.of(context).colorScheme.onBackground.withOpacity(0.2);
      }

      pie.add(pieChartSectionData(value: value, color: color, avatar: avatar));

      count++;
    }

    return pie;
  }

  PieChartSectionData pieChartSectionData({
    required double value,
    required Color color,
    String avatar = '',
  }) {
    final isTouched = value == touchedIndex;
    final fontSize = isTouched ? 18.0 : 14.0;
    final radius = isTouched ? 110.0 : 100.0;
    final widgetSize = isTouched ? 55.0 : 40.0;
    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

    return PieChartSectionData(
      color: color,
      value: value,
      title: '${value.round()}%',
      radius: radius,
      titleStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: const Color(0xffffffff),
        shadows: shadows,
      ),
      badgeWidget: avatar.isNotEmpty
          ? _Badge(
              avatar,
              size: widgetSize,
              borderColor: Colors.black,
            )
          : const SizedBox(),
      badgePositionPercentageOffset: .98,
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
        ),
      ),
    );
  }
}
