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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProfileStatWidget(
          title: friendsLabelString,
          value: profile.friends.length.toString(),
          onPressed: () => context.showSnackBar(message: friendsLabelString),
        ),
        ProfileStatWidget(
          title: teamsLabelString,
          value: profile.teams.length.toString(),
          onPressed: () => context.showSnackBar(message: teamsLabelString),
        ),
        ProfileStatWidget(
          title: streakLabelString,
          value: ref.read(profileProvider.notifier).daysOld().toString(),
          onPressed: () => context.showSnackBar(message: streakLabelString),
        ),
      ],
    );
  }
}
