import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'xwidgets.dart';

class JoinHabitatMakeWidget extends ConsumerWidget {
  const JoinHabitatMakeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const JoinHabitatSectionHeaderWidget(text: 'Admin'),
        const Card(
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 12.0,
            ),
            child: Column(
              children: [
                JoinHabitatMakeDropdownHabitWidget(),
                SizedBox(height: 16.0),
                JoinHabitatMakeDropdownAnimalWidget(),
                SizedBox(height: 16.0),
                JoinHabitatCapWidget(),
                SizedBox(height: 16.0),
                JoinHabitatIsPrivateWidget(),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24.0),
        const JoinHabitatSectionHeaderWidget(text: 'Personal'),
        const Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: JoinHabitatGoalWidget(),
          ),
        ),
        const SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: () {
            // TODO: Make the habitat and set the user join as the creator
          },
          child: const Text('Make Your Habitat'),
        ),
      ],
    );
  }
}
