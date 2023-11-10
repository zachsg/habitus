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
    await ref.read(leaderboardProvider.notifier).loadHabitatsHabitats();
    // await ref.read(leaderboardProvider.notifier).loadProfilesHabitats();
    // await ref.read(leaderboardProvider.notifier).loadCreditsHabitats();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(leaderboardProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weekly Leaderboard'),
          actions: const [
            LeaderboardByCreditsToggleWidget(),
          ],
          bottom: TabBar(
            onTap: (index) => ref
                .read(leaderboardProvider.notifier)
                .setIsByHabitat(index == 0 ? true : false),
            tabs: const [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.group_work_outlined),
                    SizedBox(width: 4.0),
                    Text('My Habitats'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.language_outlined),
                    SizedBox(width: 4.0),
                    Text('Global'),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                const LeaderboardHabitatPickerWidget(),
                provider.loading
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator.adaptive(),
                        ],
                      )
                    : Expanded(
                        child: provider.byCredit
                            ? const LeaderboardByCreditsListWidget()
                            : const LeaderboardByAccomplishedListWidget(),
                      ),
              ],
            ),
            Column(
              children: [
                const LeaderboardHabitTypePickerWidget(),
                provider.loading
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator.adaptive(),
                        ],
                      )
                    : Expanded(
                        child: provider.byCredit
                            ? const LeaderboardByCreditsListWidget()
                            : const LeaderboardByAccomplishedListWidget(),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
