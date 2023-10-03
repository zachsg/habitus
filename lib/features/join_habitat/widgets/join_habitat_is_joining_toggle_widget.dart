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
        Text('Make One'.toUpperCase()),
        const SizedBox(width: 8.0),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Switch.adaptive(
              activeColor: Theme.of(context).colorScheme.primary,
              activeTrackColor: Theme.of(context).colorScheme.primaryContainer,
              value: joinHabitat.isJoining,
              onChanged: (isOn) =>
                  ref.read(joinHabitatProvider.notifier).setIsJoining(isOn),
            );
          },
        ),
        const SizedBox(width: 8.0),
        Text('Join One'.toUpperCase()),
      ],
    );
  }
}
