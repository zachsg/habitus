import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../leaderboard.dart';

class LeaderboardByCreditsToggleWidget extends ConsumerWidget {
  const LeaderboardByCreditsToggleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(leaderboardProvider);

    return IconButton(
      onPressed: () => ref
          .read(leaderboardProvider.notifier)
          .setIsByCredit(!provider.byCredit),
      icon:
          Icon(provider.byCredit ? Icons.schedule : Icons.scoreboard_outlined),
    );
  }
}
