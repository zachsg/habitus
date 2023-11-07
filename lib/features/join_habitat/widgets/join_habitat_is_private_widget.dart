import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../join_habitat.dart';

class JoinHabitatIsPrivateWidget extends ConsumerStatefulWidget {
  const JoinHabitatIsPrivateWidget({super.key});

  @override
  ConsumerState createState() => _JoinHabitatIsPrivateWidgetState();
}

class _JoinHabitatIsPrivateWidgetState
    extends ConsumerState<JoinHabitatIsPrivateWidget>
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
    final provider = ref.watch(joinHabitatProvider);

    return Row(
      children: [
        Text(
          'Public',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(width: 8.0),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Switch.adaptive(
              activeColor: Theme.of(context).colorScheme.primary,
              activeTrackColor: Theme.of(context).colorScheme.primaryContainer,
              value: provider.isOpen,
              onChanged: (isOn) =>
                  ref.read(joinHabitatProvider.notifier).setIsOpen(isOn),
            );
          },
        ),
      ],
    );
  }
}
