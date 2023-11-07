import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobn/helpers/extensions.dart';

import '../../../helpers/strings.dart';
import '../../../models/animal.dart';
import '../join_habitat.dart';

class JoinHabitatMakeDropdownAnimalWidget extends ConsumerWidget {
  const JoinHabitatMakeDropdownAnimalWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Text(
          joinHabitatAnimalString,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Text(':'),
        const SizedBox(width: 8),
        DropdownButton<Animal>(
          value: ref.watch(joinHabitatProvider).animal,
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
          onChanged: (Animal? animal) {
            if (animal != null) {
              ref.read(joinHabitatProvider.notifier).updateAnimal(animal);
            }
          },
          items: Animal.values.map<DropdownMenuItem<Animal>>((Animal animal) {
            return DropdownMenuItem<Animal>(
              value: animal,
              child: Text(
                animal.name.capitalize(),
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
