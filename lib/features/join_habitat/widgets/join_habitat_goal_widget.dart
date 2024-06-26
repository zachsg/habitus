import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../join_habitat.dart';

class JoinHabitatGoalWidget extends ConsumerWidget {
  const JoinHabitatGoalWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(joinHabitatProvider);
    final isIOS = Platform.isIOS;

    return Row(
      children: [
        Text(
          joinHabitatGoalString,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Text(':'),
        IconButton(
          onPressed: ref.read(joinHabitatProvider.notifier).decrementGoal,
          icon: Icon(
            isIOS ? CupertinoIcons.minus_circle : Icons.remove_circle,
            size: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '${provider.goal}',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: ref.read(joinHabitatProvider.notifier).incrementGoal,
          icon: Icon(
            isIOS ? CupertinoIcons.add_circled : Icons.add_circle,
            size: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          provider.unit.name,
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
