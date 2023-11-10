import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobn/helpers/extensions.dart';

import '../../../models/habit_type.dart';
import '../../profile/profile.dart';
import '../leaderboard.dart';

class LeaderboardHabitTypePickerWidget extends ConsumerWidget {
  const LeaderboardHabitTypePickerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(leaderboardProvider);
    final profile = ref.watch(profileProvider).profile;

    final Set<HabitType> habitTypes = {};
    for (final goal in profile.goals) {
      final type = HabitType.values
          .firstWhere((type) => type.name == goal.habit.toLowerCase());
      habitTypes.add(type);
    }

    return SizedBox(
      height: 64.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: habitTypes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final habitType = habitTypes.elementAt(index);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text(habitType.name.habitDoing()),
              selected: provider.habitType == habitType,
              onSelected: (bool selected) => ref
                  .read(leaderboardProvider.notifier)
                  .setHabitType(habitType),
            ),
          );
        },
      ),
    );
  }
}
