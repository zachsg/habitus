import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../models/xmodels.dart';
import '../../profile/profile.dart';
import '../habitats.dart';

class HabitatsHabitatProgressWidget extends ConsumerWidget {
  const HabitatsHabitatProgressWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider).profile;
    final allMyActions = ref.watch(habitatsProvider).actions;

    int goalValue = 1;
    if (profile.goals.isNotEmpty) {
      goalValue = profile.goals
          .firstWhere((goal) => goal.habitatId == habitat.id)
          .value;
    }

    final actions =
        allMyActions.where((action) => action.habitatId == habitat.id);

    double progress = 0.0;
    int possible = goalValue;

    for (final action in actions) {
      progress += action.goal.value;
    }

    progress = progress / possible;

    if (progress > 1) {
      progress = 1;
    }

    return CircularPercentIndicator(
      radius: 48.0,
      lineWidth: 20.0,
      percent: progress,
      center: Text("${(progress * 100).round()}%"),
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: const Alignment(0.8, 1),
        colors: <Color>[
          Theme.of(context).colorScheme.primaryContainer,
          Theme.of(context).colorScheme.primary,
        ], // Gradient from https://learnui.design/tools/gradient-generator.html
        tileMode: TileMode.mirror,
      ),
    );
  }
}
