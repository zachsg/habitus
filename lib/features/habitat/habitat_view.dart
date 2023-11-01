import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../helpers/constants.dart';
import '../../helpers/strings.dart';
import '../../models/xmodels.dart';
import '../grow/grow_view.dart';
import '../habitat_settings/habitat_settings_view.dart';
import '../profile/profile.dart';
import 'habitat.dart';
import 'widgets/xwidget.dart';

class HabitatView extends ConsumerStatefulWidget {
  const HabitatView({super.key, required this.habitat});

  final HUHabitatModel habitat;

  static const routeName = 'habitat';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HabitatViewState();
}

class _HabitatViewState extends ConsumerState<HabitatView> {
  bool _settingsLoading = false;

  @override
  void initState() {
    _initialDataLoad();
    super.initState();
  }

  Future<void> _initialDataLoad() async {
    await ref.read(habitatProvider(widget.habitat).notifier).loadProfiles();
    await ref.read(habitatProvider(widget.habitat).notifier).loadActions();
    await ref.read(habitatProvider(widget.habitat).notifier).loadCallouts();
    await ref
        .read(habitatProvider(widget.habitat).notifier)
        .loadHabitatWithId(widget.habitat.id);
  }

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;
    final habitatP = ref.watch(habitatProvider(widget.habitat));
    final loading = habitatP.loading;
    final day = habitatP.day;
    final today = DateTime.now();
    final isToday = day.isAfter(today.copyWith(hour: 0, minute: 0)) &&
        day.isBefore(today.copyWith(hour: 24, minute: 59));

    final profile = ref.watch(profileProvider).profile;

    final callouts = habitatP.callouts;
    final unFinishedCallouts = callouts.where((callout) => !callout.done);
    final actions = habitatP.actions;

    final myActions =
        actions.where((action) => action.ownerId == profile.id).toList();

    int elapsed = 0;
    for (final action in myActions) {
      elapsed += action.goal.value;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.habitat.name),
        actions: [
          _settingsLoading
              ? const CircularProgressIndicator.adaptive()
              : IconButton(
                  onPressed: () async {
                    setState(() => _settingsLoading = true);
                    await ref
                        .read(habitatProvider(widget.habitat).notifier)
                        .loadHabitatWithId(widget.habitat.id);
                    setState(() => _settingsLoading = false);

                    final habitat =
                        ref.read(habitatProvider(widget.habitat)).habitat;

                    if (context.mounted) {
                      context.pushNamed(
                        HabitatSettingsView.routeName,
                        pathParameters: {
                          'id': habitat.id.toString(),
                          'habitat_settings_id': habitat.id.toString()
                        },
                        extra: habitat,
                      );
                    }
                  },
                  icon: isIOS
                      ? const Icon(CupertinoIcons.settings_solid)
                      : const Icon(Icons.settings),
                ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Row(),
              unFinishedCallouts.isNotEmpty
                  ? HabitatCalloutBoxWidget(habitat: widget.habitat)
                  : const SizedBox(),
              const SizedBox(height: 8.0),
              loading
                  ? const CircularProgressIndicator.adaptive()
                  : actions.isEmpty & !isToday
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            HabitatDaySelectorWidget(habitat: widget.habitat),
                            HabitatEmptyStateWidget(habitat: widget.habitat),
                          ],
                        )
                      : Column(
                          children: [
                            HabitatDaySelectorWidget(habitat: widget.habitat),
                            const SizedBox(height: 24.0),
                            HabitatGoalProgressChartWidget(
                              habitat: widget.habitat,
                            ),
                            const SizedBox(height: 32.0),
                            HabitatHabitmatesWidget(habitat: widget.habitat),
                            const SizedBox(height: 32.0),
                            HabitatActivityWidget(
                              habitat: widget.habitat,
                              actions: actions,
                              callouts: callouts,
                              isToday: isToday,
                            ),
                            const SizedBox(height: 96),
                          ],
                        ),
            ],
          ),
        ),
      ),
      floatingActionButton: isToday
          ? FloatingActionButton.extended(
              onPressed: () {
                WakelockPlus.enable();

                context.pushNamed(
                  GrowView.routeName,
                  pathParameters: {
                    'id': widget.habitat.id.toString(),
                    'habitat_id': widget.habitat.id.toString(),
                  },
                  extra: HUHabitatAndActionModel(
                    habitat: widget.habitat,
                    elapsed: elapsed,
                  ),
                );
              },
              label: Row(
                children: [
                  Text(widget.habitat.goal.habit),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    mobnLogoSvg,
                    semanticsLabel: mobnLogoString,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onPrimaryContainer,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
