import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../join_habitat.dart';

class JoinHabitatCapWidget extends ConsumerWidget {
  const JoinHabitatCapWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cap = ref.watch(joinHabitatProvider).cap;
    final isIOS = Platform.isIOS;

    return Row(
      children: [
        Text(
          joinHabitatCapString,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Text(':'),
        IconButton(
          onPressed: ref.read(joinHabitatProvider.notifier).decrementCap,
          icon: Icon(
            isIOS ? CupertinoIcons.minus_circle : Icons.remove_circle,
            size: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '$cap',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: ref.read(joinHabitatProvider.notifier).incrementCap,
          icon: Icon(
            isIOS ? CupertinoIcons.add_circled : Icons.add_circle,
            size: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
