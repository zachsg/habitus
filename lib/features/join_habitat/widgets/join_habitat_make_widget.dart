import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinHabitatMakeWidget extends ConsumerWidget {
  const JoinHabitatMakeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text('Pick Habit'), // TODO: Picker
        Text('Pick Your Animal'), // TODO: Picker (or maybe random animal)
        Text('Member cap'), // TODO: Stepper
        Text('Is Private?'), // TODO: Toggle
        Text('Personal Goal'), // TODO: Stepper
        ElevatedButton(
          onPressed: () {
            // TODO: Make the habitat and set the user join as the creator
          },
          child: Text('Make Habitat'),
        ),
      ],
    );
  }
}
