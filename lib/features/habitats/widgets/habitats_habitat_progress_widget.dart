import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    return Row(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                borderRadius: BorderRadius.only(
                  bottomRight: progress == 1
                      ? const Radius.circular(12.0)
                      : const Radius.circular(0.0),
                  bottomLeft: const Radius.circular(12.0),
                ),
              ),
              height: 20,
              width: (MediaQuery.of(context).size.width - 32) * progress,
            ),
          ],
        ),
      ],
    );
  }
}
