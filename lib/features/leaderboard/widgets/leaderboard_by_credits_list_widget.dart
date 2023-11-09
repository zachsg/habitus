import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobn/helpers/extensions.dart';

import '../../../models/xmodels.dart';
import '../../profile/profile.dart';
import '../leaderboard.dart';

class LeaderboardByCreditsListWidget extends ConsumerWidget {
  const LeaderboardByCreditsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: DataTable(
        dataRowMinHeight: 50,
        dataRowMaxHeight: 60,
        columns: const [
          DataColumn(label: Text('Rank')),
          DataColumn(label: Text('Points')),
          DataColumn(label: Text('Habitmate')),
        ],
        rows: _tableRows(context, ref),
      ),
    );
  }

  List<DataRow> _tableRows(BuildContext context, WidgetRef ref) {
    final List<DataRow> children = [];

    final provider = ref.watch(leaderboardProvider);
    final myProfile = ref.watch(profileProvider).profile;

    int index = 0;
    for (final profile in provider.profiles) {
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

      bool isFirst = index == 0 && credit.credits > 0;
      bool isSecond = index == 1 && credit.credits > 0;
      bool isThird = index == 2 && credit.credits > 0;
      bool isUnranked = index > 2 || credit.credits == 0;

      final isMe = profile.id == myProfile.id;

      final row = DataRow(
        selected: isMe ? true : false,
        cells: [
          if (isFirst)
            DataCell(
              Icon(
                Icons.emoji_events,
                color: Colors.yellow.shade800,
                size: 32,
              ),
            ),
          if (isSecond)
            DataCell(
              Icon(
                Icons.emoji_events,
                color: Theme.of(context).colorScheme.secondary,
                size: 32,
              ),
            ),
          if (isThird)
            DataCell(
              Icon(
                Icons.emoji_events,
                color: Theme.of(context).colorScheme.tertiary,
                size: 32,
              ),
            ),
          if (isUnranked)
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${index + 1}.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          DataCell(
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${credit.credits}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  credit.credits == 1 ? 'pt ' : 'pts',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          DataCell(
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text('@${profile.handle}'),
              ],
            ),
          ),
        ],
      );

      children.add(row);

      index++;
    }

    return children;
  }
}
