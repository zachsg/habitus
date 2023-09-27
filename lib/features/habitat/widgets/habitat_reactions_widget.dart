import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/xmodels.dart';
import '../habitat.dart';

class HabitatReactionsWidget extends ConsumerWidget {
  const HabitatReactionsWidget({
    super.key,
    required this.profile,
    required this.action,
    required this.habitat,
    required this.reactions,
  });

  final HUProfileModel profile;
  final HUActionModel action;
  final HUHabitatModel habitat;
  final List<HUReactionModel> reactions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profiles = ref.watch(habitatProvider(habitat)).profiles;

    return Row(
      children: [
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _reactionWidgets(context, profiles),
          ),
        ),
      ],
    );
  }

  List<Widget> _reactionWidgets(
    BuildContext context,
    List<HUProfileModel> profiles,
  ) {
    List<Widget> children = [];

    for (final reaction in reactions) {
      final profile =
          profiles.firstWhere((profile) => profile.id == reaction.ownerId);

      final child = Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            '@${profile.handle}',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4.0),
          Text(reaction.icon),
          const SizedBox(width: 4.0),
          Text(reaction.text),
        ],
      );

      children.add(child);
    }

    return children;
  }
}
