import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../team.dart';

class TeamTeammatesWidget extends ConsumerWidget {
  const TeamTeammatesWidget({super.key, required this.team});

  final HUTeamModel team;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profiles = ref.watch(teamProvider(team)).profiles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(),
        Text(
          teammatesString.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Wrap(
          spacing: 16,
          children: _teammates(profiles),
        ),
      ],
    );
  }

  List<Widget> _teammates(List<HUProfileModel> profiles) {
    final List<Widget> children = [];

    for (final profile in profiles) {
      final text = Text(profile.name);

      children.add(text);
    }

    return children;
  }
}
