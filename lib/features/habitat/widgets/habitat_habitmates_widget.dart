import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../../../helpers/extensions.dart';
import '../habitat.dart';

class HabitatHabitmatesWidget extends ConsumerWidget {
  const HabitatHabitmatesWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profiles = ref.watch(habitatProvider(habitat)).profiles;
    final actions = ref.watch(habitatProvider(habitat)).actions;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(),
        Text(
          habitmatesString.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 4.0),
        Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          children: _habitmates(context, ref, habitat, profiles, actions),
        ),
      ],
    );
  }

  List<Widget> _habitmates(
    BuildContext context,
    WidgetRef ref,
    HUHabitatModel habitat,
    List<HUProfileModel> profiles,
    List<HUActionModel> actions,
  ) {
    final List<Widget> children = [];

    int index = 0;

    for (final profile in profiles) {
      final text = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HabitatPersonalCompletionChartWidget(
            habitat: habitat,
            profile: profile,
            actions: actions
                .where((action) => action.ownerId == profile.id)
                .toList(),
            color: index.toColor(),
          ),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    profile.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  habitat.creatorId == profile.id
                      ? Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: Icon(
                            Icons.star,
                            size: 18,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        )
                      : habitat.admins.contains(profile.id)
                          ? Padding(
                              padding: const EdgeInsets.only(left: 2.0),
                              child: Icon(
                                Icons.star_half,
                                size: 18,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            )
                          : const SizedBox(),
                ],
              ),
              Text(
                '@${profile.handle}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      );

      children.add(text);
      index += 1;
    }

    return children;
  }
}

class HabitatPersonalCompletionChartWidget extends ConsumerWidget {
  const HabitatPersonalCompletionChartWidget({
    super.key,
    required this.habitat,
    required this.profile,
    required this.actions,
    required this.color,
  });

  final HUHabitatModel habitat;
  final HUProfileModel profile;
  final List<HUActionModel> actions;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const max = 32.0;

    final goal =
        profile.goals.firstWhere((goal) => goal.habitatId == habitat.id);

    final multiplier = goal.value / max;

    double progress = 0.0;
    for (final action in actions) {
      progress += action.goal.value;
    }

    if (multiplier > 0.0) {
      progress /= multiplier;
    } else {
      // progress = 0;
    }

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: const BorderRadius.all(Radius.circular(2)),
          ),
          width: 12,
          height: max,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(2),
                bottomRight: Radius.circular(2),
              ),
            ),
            width: 12,
            height: progress,
          ),
        ),
      ],
    );
  }
}
