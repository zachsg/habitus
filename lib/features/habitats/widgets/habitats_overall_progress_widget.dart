import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../profile/profile.dart';
import '../habitats.dart';

class HabitatsOverallProgressWidget extends ConsumerWidget {
  const HabitatsOverallProgressWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIOS = Platform.isIOS;
    final profile = ref.watch(profileProvider).profile;
    final actions = ref.watch(habitatsProvider).actions;

    int possible = profile.goals.length;
    double progress = 0;

    if (profile.goals.isNotEmpty) {
      for (final goal in profile.goals) {
        int acutelyPossible = goal.value;
        final actionsForGoal =
            actions.where((action) => action.habitatId == goal.habitatId);

        int attained = 0;
        for (final action in actionsForGoal) {
          attained += action.goal.value;
        }

        double progressBeforeWeight = attained / acutelyPossible;
        if (progressBeforeWeight > 1) {
          progressBeforeWeight = 1;
        }

        progress += progressBeforeWeight;
      }
      progress /= possible;
    }

    return SizedBox(
      height: MediaQuery.of(context).size.width / 1.5,
      width: MediaQuery.of(context).size.width / 1.5,
      child: Center(
        child: CircularPercentIndicator(
          backgroundColor:
              Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
          progressColor: Theme.of(context).colorScheme.primary,
          radius: MediaQuery.of(context).size.width / 3.5,
          lineWidth: 36.0,
          percent: progress,
          center: progress == 1
              ? Icon(
                  isIOS ? CupertinoIcons.star_fill : Icons.star,
                  size: MediaQuery.of(context).size.width / 4.5,
                  color: Colors.yellow.shade800,
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${(progress * 100).round()}%",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      'Daily Progress',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
