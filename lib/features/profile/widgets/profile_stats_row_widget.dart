import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../../../helpers/extensions.dart';
import '../profile.dart';
import 'xwidgets.dart';

class ProfileStatsRowWidget extends ConsumerWidget {
  const ProfileStatsRowWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider).profile;
    final daysOld = ref.read(profileProvider.notifier).daysOld();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProfileStatWidget(
          title: friendsLabelString,
          value: profile.friends.length.toString(),
          // TODO: Show bottom sheet with list of user's friends
          onPressed: () => context.showSnackBar(message: friendsLabelString),
        ),
        ProfileStatWidget(
          title: teamsLabelString,
          value: profile.teams.length.toString(),
          // TODO: Show bottom sheet with list of user's teams
          onPressed: () => context.showSnackBar(message: teamsLabelString),
        ),
        ProfileStatWidget(
          title: streakLabelString,
          value: daysOld.toString(),
          onPressed: () =>
              context.showSnackBar(message: 'You are $daysOld days old.'),
        ),
      ],
    );
  }
}