import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'leaderboard.dart';
import 'widgets/xwidgets.dart';

class LeaderboardView extends ConsumerStatefulWidget {
  const LeaderboardView({super.key});

  static const routeName = 'leaderboard';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LeaderboardViewState();
}

class _LeaderboardViewState extends ConsumerState<LeaderboardView> {
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  Future<void> _loadData() async {
    await ref.read(leaderboardProvider.notifier).loadHabitats();
    await ref.read(leaderboardProvider.notifier).loadProfiles();
    await ref.read(leaderboardProvider.notifier).loadCredits();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(leaderboardProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Week\'s Leaders'),
        actions: const [
          LeaderboardByCreditsToggleWidget(),
        ],
      ),
      body: Column(
        children: [
          const LeaderboardHabitatPickerWidget(),
          provider.loading
              ? const CircularProgressIndicator.adaptive()
              : Expanded(
                  child: provider.byCredit
                      ? const LeaderboardByCreditsListWidget()
                      : const LeaderboardByAccomplishedListWidget(),
                ),
        ],
      ),
    );
  }
}
