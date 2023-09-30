import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../join_habitat.dart';

class JoinHabitatDropdownButtonWidget extends ConsumerWidget {
  const JoinHabitatDropdownButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dropdownOptions = [
      readString,
      exerciseString,
      meditateString,
      cookString,
    ];

    return Row(
      children: [
        Text(
          joinHabitatHabitString,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Text(':'),
        const SizedBox(width: 8),
        DropdownButton<String>(
          value: ref.watch(joinHabitatProvider).habitat.goal.habit,
          icon: Icon(
            Icons.arrow_downward,
            color: Theme.of(context).colorScheme.primary,
          ),
          elevation: 16,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
          underline: Container(
            height: 2,
            color: Theme.of(context).colorScheme.primary,
          ),
          onChanged: (String? habit) {
            if (habit != null) {
              ref
                  .read(joinHabitatProvider.notifier)
                  .updateHabitatGoalHabit(habit);
            }
          },
          items: dropdownOptions.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
