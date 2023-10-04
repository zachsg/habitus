import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../habitat_settings.dart';

class HabitatSettingsGoalWidget extends ConsumerWidget {
  const HabitatSettingsGoalWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIOS = Platform.isIOS;
    final profile = ref.watch(habitatSettingsProvider(habitat)).profile;
    final goal =
        profile.goals.firstWhere((goal) => goal.habitatId == habitat.id);

    return Row(
      children: [
        Text(
          joinHabitatGoalString,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Text(':'),
        IconButton(
          onPressed: ref
              .read(habitatSettingsProvider(habitat).notifier)
              .decrementHabitatGoal,
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
          onPressed: ref
              .read(habitatSettingsProvider(habitat).notifier)
              .incrementHabitatGoal,
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
