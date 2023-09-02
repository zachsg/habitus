import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../join_team.dart';

class JoinTeamGoalWidget extends ConsumerWidget {
  const JoinTeamGoalWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goal = ref.watch(joinTeamProvider).team.goal;
    final isIOS = Platform.isIOS;

    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          joinTeamGoalString,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Text(':'),
        IconButton(
          onPressed: ref.read(joinTeamProvider.notifier).decrementTeamGoalValue,
          icon: Icon(
            isIOS ? CupertinoIcons.minus_circle : Icons.remove_circle,
            size: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '${goal.value}',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: ref.read(joinTeamProvider.notifier).incrementTeamGoalValue,
          icon: Icon(
            isIOS ? CupertinoIcons.add_circled : Icons.add_circle,
            size: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          goal.unit.name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          ' / day',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
