import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobn/helpers/extensions.dart';
import 'package:mobn/models/xmodels.dart';

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
        title: const Text('Weekly Leaderboard'),
      ),
      body: Column(
        children: [
          const LeaderboardHabitatPickerWidget(),
          provider.loading
              ? const CircularProgressIndicator.adaptive()
              : Expanded(
                  child: ListView.builder(
                    itemCount: provider.profiles.length,
                    itemBuilder: (context, index) {
                      final profile = provider.profiles[index];
                      final credit = provider.credits.firstWhere(
                        (credit) => credit.ownerId == profile.id,
                        orElse: () => HUCreditModel(
                          updatedAt: DateTime.now(),
                          ownerId: profile.id,
                          habitatId: provider.habitat.id,
                          year: DateTime.now().year,
                          weekNumber: DateTime.now().weekNumber(),
                          credits: 0,
                        ),
                      );

                      return ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${credit.credits}',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              credit.credits == 1 ? 'pt ' : 'pts',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        title: Text(profile.name),
                        subtitle: Text('@${profile.handle}'),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
