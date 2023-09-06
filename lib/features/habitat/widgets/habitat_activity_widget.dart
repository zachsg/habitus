import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../habitat.dart';

class HabitatActivityWidget extends ConsumerWidget {
  const HabitatActivityWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = ref.watch(habitatProvider(habitat)).actions;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(),
        Text(
          habitatActivityString.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: actions.length,
          itemBuilder: (context, index) {
            final action = actions[index];

            return ListTile(
              title: Text(action.goal.habit),
            );
          },
        )
      ],
    );
  }
}
