import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../profile/profile.dart';
import '../habitats.dart';

class HabitatsOverallProgressWidget extends ConsumerWidget {
  const HabitatsOverallProgressWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider).profile;
    final actions = ref.watch(habitatsProvider).actions;

    int possible = profile.goals.length;
    double progress = 0;

    if (profile.goals.length > 1) {
      for (final goal in profile.goals) {
        final actionsForGoal =
            actions.where((action) => action.habitatId == goal.habitatId);

        int attained = 0;
        for (final action in actionsForGoal) {
          attained += action.goal.value;
        }

        if (attained >= goal.value) {
          progress += 1;
        }
      }

      if (possible > 0) {
        progress = progress / possible.toDouble();
      }
    } else {
      // User only has 1 goal, so progress should be actions against that 1 goal
      final actionsForGoal = actions
          .where((action) => action.habitatId == profile.goals.first.habitatId);

      possible = profile.goals.first.value;
      int attained = 0;
      for (final action in actionsForGoal) {
        attained += action.goal.value;
      }

      progress = attained / possible;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 192,
        width: 192,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/progress_${_progressRounder(progress)}.png',
            ),
          ],
        ),
      ),
    );
  }

  _progressRounder(double progress) {
    progress *= 100;

    switch (progress) {
      case >= 100:
        return 100;
      case >= 90:
        return 90;
      case >= 80:
        return 80;
      case >= 70:
        return 70;
      case >= 60:
        return 60;
      case >= 50:
        return 50;
      case >= 40:
        return 40;
      case >= 30:
        return 30;
      case >= 20:
        return 20;
      case >= 10:
        return 10;
      default:
        return 0;
    }
  }
}
