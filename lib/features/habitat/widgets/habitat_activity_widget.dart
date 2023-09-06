import 'package:intl/intl.dart';
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
    final profiles = ref.watch(habitatProvider(habitat)).profiles;

    final DateFormat formatter = DateFormat('h:mm a');

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
            final profile =
                profiles.firstWhere((profile) => profile.id == action.ownerId);

            return Column(
              children: [
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Wrap(
                        children: [
                          Text(
                            '@${profile.handle}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            '${action.goal.habit.toLowerCase()} for ${action.goal.value} ${action.goal.unit.name}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      formatter.format(action.createdAt.toLocal()),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
              ],
            );
          },
        )
      ],
    );
  }
}
