import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobn/helpers/extensions.dart';

import '../../../models/xmodels.dart';
import '../leaderboard.dart';

class LeaderboardByAccomplishedListWidget extends ConsumerWidget {
  const LeaderboardByAccomplishedListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(leaderboardProvider);

    return ListView.builder(
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

        bool isFirst = index == 0 && credit.accomplished > 0;
        bool isSecond = index == 1 && credit.accomplished > 0;
        bool isThird = index == 2 && credit.accomplished > 0;
        bool isUnranked = index > 2 || credit.accomplished == 0;

        return ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isFirst)
                Icon(
                  Icons.emoji_events,
                  color: Colors.yellow.shade800,
                  size: 32,
                ),
              if (isSecond)
                Icon(
                  Icons.emoji_events,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 32,
                ),
              if (isThird)
                Icon(
                  Icons.emoji_events,
                  color: Theme.of(context).colorScheme.tertiary,
                  size: 32,
                ),
              if (isUnranked)
                Icon(
                  Icons.emoji_events,
                  color: Theme.of(context).colorScheme.background,
                  size: 32,
                ),
              const SizedBox(width: 12.0),
              Text(
                credit.accomplished.toTimeShort(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          title: Text(profile.name),
          subtitle: Text('@${profile.handle}'),
        );
      },
    );
  }
}
