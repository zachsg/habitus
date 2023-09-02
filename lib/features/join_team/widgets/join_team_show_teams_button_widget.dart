import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../join_team.dart';

class JoinTeamShowTeamsButtonWidget extends ConsumerWidget {
  const JoinTeamShowTeamsButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(joinTeamProvider).loading;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: loading
              ? null
              : ref.read(joinTeamProvider.notifier).findMatchingTeams,
          child: loading
              ? const CircularProgressIndicator.adaptive()
              : const Text(showTeamsString),
        ),
      ],
    );
  }
}
