import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../leaderboard.dart';

class LeaderboardByCreditsToggleWidget extends ConsumerStatefulWidget {
  const LeaderboardByCreditsToggleWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LeaderboardByCreditsToggleWidgetState();
}

class _LeaderboardByCreditsToggleWidgetState
    extends ConsumerState<LeaderboardByCreditsToggleWidget>
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
    final provider = ref.watch(leaderboardProvider);
    return Row(
      children: [
        const Icon(Icons.schedule),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Switch.adaptive(
              activeColor: Theme.of(context).colorScheme.primary,
              value: provider.byCredit,
              onChanged: (isOn) {
                ref.read(leaderboardProvider.notifier).setIsByCredit(isOn);
              },
            );
          },
        ),
        const SizedBox(width: 4.0),
      ],
    );
  }
}
