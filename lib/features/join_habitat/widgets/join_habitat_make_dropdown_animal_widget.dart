import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/animals.dart';
import '../../../helpers/strings.dart';
import '../join_habitat.dart';

class JoinHabitatMakeDropdownAnimalWidget extends ConsumerWidget {
  const JoinHabitatMakeDropdownAnimalWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitatName =
        ref.watch(joinHabitatProvider).habitat.name.split(' ').toList();
    final animal = habitatName.isEmpty
        ? Animals.all.first
        : habitatName.length > 1
            ? habitatName[1]
            : habitatName[0];

    return Row(
      children: [
        Text(
          joinHabitatAnimalString,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Text(':'),
        const SizedBox(width: 8),
        DropdownButton<String>(
          value: animal,
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
          onChanged: (String? animal) {
            if (animal != null) {
              ref
                  .read(joinHabitatProvider.notifier)
                  .updateHabitatNameHabit(animal);
            }
          },
          items: Animals.all.map<DropdownMenuItem<String>>((String value) {
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
