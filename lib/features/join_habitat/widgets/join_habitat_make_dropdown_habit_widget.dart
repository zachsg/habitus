import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobn/helpers/extensions.dart';

import '../../../helpers/strings.dart';
import '../../../models/habit_type.dart';
import '../join_habitat.dart';

class JoinHabitatMakeDropdownHabitWidget extends ConsumerWidget {
  const JoinHabitatMakeDropdownHabitWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Text(
          joinHabitatHabitString,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Text(':'),
        const SizedBox(width: 8),
        DropdownButton<HabitType>(
          value: ref.watch(joinHabitatProvider).type,
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
          onChanged: (HabitType? type) {
            if (type != null) {
              ref.read(joinHabitatProvider.notifier).updateHabitType(type);
            }
          },
          items: HabitType.values
              .map<DropdownMenuItem<HabitType>>((HabitType type) {
            return DropdownMenuItem<HabitType>(
              value: type,
              child: Text(
                type.name.capitalize(),
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
