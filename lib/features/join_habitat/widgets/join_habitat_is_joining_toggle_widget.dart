import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../join_habitat.dart';

class JoinHabitatIsJoiningToggleWidget extends ConsumerStatefulWidget {
  const JoinHabitatIsJoiningToggleWidget({super.key});

  @override
  ConsumerState createState() => _JoinHabitatIsJoiningToggleWidgetState();
}

class _JoinHabitatIsJoiningToggleWidgetState
    extends ConsumerState<JoinHabitatIsJoiningToggleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final joinHabitat = ref.watch(joinHabitatProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            ref.read(joinHabitatProvider.notifier).setIsJoining(false);
            ref.read(joinHabitatProvider.notifier).resetHabitat();
          },
          child: Text(
            'Make One'.toUpperCase(),
            style: joinHabitat.isJoining
                ? Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w200)
                : Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
          ),
        ),
        const SizedBox(width: 8.0),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Switch.adaptive(
              activeColor: Theme.of(context).colorScheme.primary,
              inactiveTrackColor: Theme.of(context).colorScheme.primary,
              activeTrackColor: Theme.of(context).colorScheme.primaryContainer,
              value: joinHabitat.isJoining,
              onChanged: (isOn) {
                ref.read(joinHabitatProvider.notifier).setIsJoining(isOn);
                ref.read(joinHabitatProvider.notifier).resetHabitat();
              },
            );
          },
        ),
        const SizedBox(width: 8.0),
        GestureDetector(
          onTap: () {
            ref.read(joinHabitatProvider.notifier).setIsJoining(true);
            ref.read(joinHabitatProvider.notifier).resetHabitat();
          },
          child: Text(
            'Join One'.toUpperCase(),
            style: joinHabitat.isJoining
                ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary)
                : Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w200),
          ),
        ),
      ],
    );
  }
}
