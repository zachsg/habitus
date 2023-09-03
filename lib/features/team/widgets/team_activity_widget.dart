import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../team.dart';

class TeamActivityWidget extends ConsumerWidget {
  const TeamActivityWidget({super.key, required this.team});

  final HUTeamModel team;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = ref.watch(teamProvider(team)).actions;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(),
        Text(
          teamActivityString.toUpperCase(),
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
