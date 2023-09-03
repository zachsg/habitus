import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../join_team.dart';

class JoinTeamAvailableTeamsWidget extends ConsumerWidget {
  const JoinTeamAvailableTeamsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(joinTeamProvider).loading;
    final teams = ref.watch(joinTeamProvider).teams;
    final error = ref.watch(joinTeamProvider).error;

    return error != null && teams.isEmpty
        ? Center(child: Text(error))
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: teams.length,
            itemBuilder: (context, index) {
              final team = teams[index];
              return ListTile(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                title: Text(team.name),
                subtitle: Text(
                  team.admins.isEmpty
                      ? '${team.admins.length + team.members.length} members'
                      : '${team.admins.length + team.members.length} members (${team.admins.length} admins)',
                ),
                trailing: loading
                    ? const CircularProgressIndicator.adaptive()
                    : FilledButton(
                        child: const Text(joinTeamString),
                        onPressed: () => ref
                            .read(joinTeamProvider.notifier)
                            .joinTeam(context, team),
                      ),
              );
            },
          );
  }
}
