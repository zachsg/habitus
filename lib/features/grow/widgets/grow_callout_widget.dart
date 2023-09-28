import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitus/features/grow/grow.dart';

import '../../../helpers/strings.dart';
import '../../../helpers/extensions.dart';
import '../../../models/xmodels.dart';
import '../../habitat/habitat.dart';
import '../../profile/profile.dart';

class GrowCalloutWidget extends ConsumerStatefulWidget {
  const GrowCalloutWidget(
      {super.key, required this.habitatAndAction, required this.setState});

  final HUHabitatAndActionModel habitatAndAction;
  final void Function(void Function()) setState;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GrowCalloutWidgetState();
}

class _GrowCalloutWidgetState extends ConsumerState<GrowCalloutWidget> {
  int? _value;

  @override
  Widget build(BuildContext context) {
    final profiles =
        ref.watch(habitatProvider(widget.habitatAndAction.habitat)).profiles;
    final actions =
        ref.watch(habitatProvider(widget.habitatAndAction.habitat)).actions;
    final profile = ref.watch(profileProvider).profile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(),
        Text(
          calloutString.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 4.0),
        Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          children: _habitmates(
            context,
            ref,
            widget.habitatAndAction.habitat,
            profiles,
            profile,
            actions,
          ),
        ),
      ],
    );
  }

  List<Widget> _habitmates(
    BuildContext context,
    WidgetRef ref,
    HUHabitatModel habitat,
    List<HUProfileModel> profiles,
    HUProfileModel myProfile,
    List<HUActionModel> actions,
  ) {
    final List<Widget> children = [];
    final List<String> userIds = [];

    int index = 0;

    final profilesMinusMe = profiles.toList();
    profilesMinusMe.removeWhere((profile) => profile.id == myProfile.id);

    for (final profile in profilesMinusMe) {
      final goal =
          profile.goals.firstWhere((goal) => goal.habitatId == habitat.id);

      double progress = 0.0;
      final relevantActions =
          actions.where((action) => action.ownerId == profile.id);
      for (final action in relevantActions) {
        progress += action.goal.value;
      }

      if (progress < goal.value) {
        userIds.add(profile.id);

        final child = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GrowPersonalCompletionChartWidget(
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
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
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

        children.add(child);
      }
      index += 1;
    }

    final List<Widget> filteredChildren =
        List<Widget>.generate(children.length, (int index) {
      return ChoiceChip(
        selected: _value == index,
        onSelected: (bool selected) {
          widget.setState(() {
            _value = selected ? index : null;

            ref
                .read(growProvider(widget.habitatAndAction).notifier)
                .setCalloutId(userIds[index]);
          });
        },
        label: children[index],
      );
    }).toList();

    return filteredChildren;
  }
}

class GrowPersonalCompletionChartWidget extends ConsumerWidget {
  const GrowPersonalCompletionChartWidget({
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
