import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../join_team.dart';

class JoinTeamAvailableTeamsWidget extends ConsumerWidget {
  const JoinTeamAvailableTeamsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teams = ref.watch(joinTeamProvider).teams;
    final error = ref.watch(joinTeamProvider).error;
    final isIOS = Platform.isIOS;

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
                  '${team.admins.length} admins, ${team.members.length} members',
                ),
                trailing: Icon(
                  isIOS ? CupertinoIcons.chevron_forward : Icons.chevron_right,
                ),
                onTap: () {
                  // TODO: Have user join team
                },
              );
            },
          );
  }
}
