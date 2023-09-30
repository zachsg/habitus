import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../helpers/extensions.dart';
import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../../../services/database.dart';
import '../../profile/profile.dart';
import '../habitat.dart';
import 'xwidget.dart';

class HabitatActivityWidget extends ConsumerStatefulWidget {
  const HabitatActivityWidget({
    super.key,
    required this.habitat,
    required this.actions,
    required this.callouts,
    required this.isToday,
  });

  final HUHabitatModel habitat;
  final List<HUActionModel> actions;
  final List<HUCalloutModel> callouts;
  final bool isToday;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HabitatActivityWidgetState();
}

class _HabitatActivityWidgetState extends ConsumerState<HabitatActivityWidget> {
  final List<HUReactionModel> _reactions = [];

  @override
  void initState() {
    _loadReactions();
    super.initState();
  }

  @override
  void didUpdateWidget(HabitatActivityWidget old) {
    _loadReactions();
    super.didUpdateWidget(old);
  }

  Future<void> _loadReactions() async {
    final Set<int> actionIds = {};
    for (final action in widget.actions) {
      actionIds.add(action.id);
    }

    final Set<int> calloutIds = {};
    for (final callout in widget.callouts) {
      calloutIds.add(callout.id);
    }

    final reactions = await Database.reactions(
      actions: actionIds.toList(),
      callouts: calloutIds.toList(),
    );
    _reactions.clear();
    if (reactions.isNotEmpty) {
      setState(() => _reactions.addAll(reactions));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    final habitatP = ref.watch(habitatProvider(widget.habitat));
    final actions = habitatP.actions;
    final profiles = habitatP.profiles;
    final callouts = habitatP.callouts;

    final DateFormat formatter = DateFormat('h:mm a');

    final List<Object> activities = List.from(actions);
    activities.addAll(callouts);
    if (activities.isNotEmpty) {
      activities.sort((a, b) {
        final createdA = a is HUActionModel
            ? a.createdAt
            : a is HUCalloutModel
                ? a.createdAt
                : DateTime.now();
        final createdB = b is HUActionModel
            ? b.createdAt
            : b is HUCalloutModel
                ? b.createdAt
                : DateTime.now();

        return createdA.isAfter(createdB) ? 1 : 0;
      });
    }

    return activities.isEmpty
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(),
              Text(
                habitatActivityString.toUpperCase(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final activity = activities[index];

                  if (activity is HUActionModel) {
                    final profile = profiles.firstWhere(
                        (profile) => profile.id == activity.ownerId);

                    return Column(
                      children: [
                        const SizedBox(height: 8.0),
                        GestureDetector(
                          onLongPress: () => widget.isToday
                              ? _reactionsSheet(
                                  context,
                                  ref.watch(profileProvider).profile,
                                  activity,
                                )
                              : null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Wrap(
                                  children: [
                                    Text(
                                      '@${profile.handle}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '${activity.goal.habit.habitDid().toLowerCase()} '
                                      'for ${activity.goal.value} '
                                      '${activity.goal.value == 1 ? activity.goal.unit.name.substring(0, activity.goal.unit.name.length - 1) : activity.goal.unit.name}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: InkWell(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(50.0),
                                        ),
                                        onTap: () => _reactionsSheet(
                                          context,
                                          ref.watch(profileProvider).profile,
                                          activity,
                                        ),
                                        child: widget.isToday
                                            ? Icon(
                                                size: 20.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                isIOS
                                                    ? CupertinoIcons.add_circled
                                                    : Icons.add_circle,
                                              )
                                            : const SizedBox(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                formatter.format(activity.createdAt.toLocal()),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        HabitatReactionsWidget(
                          profile: ref.watch(profileProvider).profile,
                          habitat: widget.habitat,
                          reactions: _reactions
                              .where((reaction) =>
                                  reaction.actionId == activity.id)
                              .toList(),
                        ),
                        const SizedBox(height: 8.0),
                        const Divider(),
                      ],
                    );
                  } else if (activity is HUCalloutModel) {
                    final callerProfile = habitatP.profiles
                        .firstWhere((profile) => profile.id == activity.caller);
                    final calleeProfile = habitatP.profiles
                        .firstWhere((profile) => profile.id == activity.callee);
                    final isDone = activity.done;

                    return Column(
                      children: [
                        const SizedBox(height: 8.0),
                        GestureDetector(
                          onLongPress: () => widget.isToday
                              ? _reactionsSheet(
                                  context,
                                  ref.watch(profileProvider).profile,
                                  activity,
                                )
                              : null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: isDone
                                    ? Wrap(
                                        children: [
                                          Text(
                                            '@${calleeProfile.handle}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          const SizedBox(width: 4.0),
                                          Text(
                                            'beat',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                          const SizedBox(width: 4.0),
                                          Text(
                                            '@${callerProfile.handle}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          Text(
                                            '\'s callout',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: InkWell(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(50.0),
                                              ),
                                              onTap: () => _reactionsSheet(
                                                context,
                                                ref
                                                    .watch(profileProvider)
                                                    .profile,
                                                activity,
                                              ),
                                              child: widget.isToday
                                                  ? Icon(
                                                      size: 20.0,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      isIOS
                                                          ? CupertinoIcons
                                                              .add_circled
                                                          : Icons.add_circle,
                                                    )
                                                  : const SizedBox(),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Wrap(
                                        children: [
                                          Text(
                                            '@${callerProfile.handle}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          const SizedBox(width: 4.0),
                                          Text(
                                            'called out',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                          const SizedBox(width: 4.0),
                                          Text(
                                            '@${calleeProfile.handle}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: InkWell(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(50.0),
                                              ),
                                              onTap: () => _reactionsSheet(
                                                context,
                                                ref
                                                    .watch(profileProvider)
                                                    .profile,
                                                activity,
                                              ),
                                              child: widget.isToday
                                                  ? Icon(
                                                      size: 20.0,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      isIOS
                                                          ? CupertinoIcons
                                                              .add_circled
                                                          : Icons.add_circle,
                                                    )
                                                  : const SizedBox(),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                              Text(
                                formatter.format(activity.createdAt.toLocal()),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        HabitatReactionsWidget(
                          profile: ref.watch(profileProvider).profile,
                          habitat: widget.habitat,
                          reactions: _reactions
                              .where((reaction) =>
                                  reaction.calloutId == activity.id)
                              .toList(),
                        ),
                        const SizedBox(height: 8.0),
                        const Divider(),
                      ],
                    );
                  }

                  return const SizedBox();
                },
              ),
            ],
          );
  }

  void _reactionsSheet(
    BuildContext context,
    HUProfileModel profile,
    Object activity,
  ) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (BuildContext context) => ReactionsBottomSheetWidget(
        habitat: widget.habitat,
        profile: profile,
        activity: activity,
        reload: _loadReactions,
      ),
    );
  }
}
