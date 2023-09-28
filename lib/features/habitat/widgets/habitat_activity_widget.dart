import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    required this.isToday,
  });

  final HUHabitatModel habitat;
  final List<HUActionModel> actions;
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
    final Set<int> ids = {};

    for (final action in widget.actions) {
      ids.add(action.id);
    }

    final reactions = await Database.reactions(ids.toList());
    _reactions.clear();
    if (reactions.isNotEmpty) {
      setState(() => _reactions.addAll(reactions));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    final actions = ref.watch(habitatProvider(widget.habitat)).actions;
    final profiles = ref.watch(habitatProvider(widget.habitat)).profiles;

    final DateFormat formatter = DateFormat('h:mm a');

    final List<HUActionModel> actionsSorted = List.from(actions);
    if (actions.isNotEmpty) {
      actionsSorted.sort((a, b) => a.createdAt.isAfter(b.createdAt) ? 1 : 0);
    }

    return actionsSorted.isEmpty
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
                itemCount: actionsSorted.length,
                itemBuilder: (context, index) {
                  final action = actionsSorted[index];
                  final profile = profiles
                      .firstWhere((profile) => profile.id == action.ownerId);

                  return Column(
                    children: [
                      const SizedBox(height: 8.0),
                      GestureDetector(
                        onLongPress: () => widget.isToday
                            ? _reactionsSheet(
                                context,
                                ref.watch(profileProvider).profile,
                                action,
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
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    '${_actionName(action.goal)} '
                                    'for ${action.goal.value} '
                                    '${action.goal.value == 1 ? action.goal.unit.name.substring(0, action.goal.unit.name.length - 1) : action.goal.unit.name}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
                                        action,
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
                              formatter.format(action.createdAt.toLocal()),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      HabitatReactionsWidget(
                        profile: ref.watch(profileProvider).profile,
                        action: action,
                        habitat: widget.habitat,
                        reactions: _reactions
                            .where((reaction) => reaction.actionId == action.id)
                            .toList(),
                      ),
                      const SizedBox(height: 8.0),
                      const Divider(),
                    ],
                  );
                },
              ),
            ],
          );
  }

  void _reactionsSheet(
    BuildContext context,
    HUProfileModel profile,
    HUActionModel action,
  ) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (BuildContext context) => ReactionsBottomSheetWidget(
        habitat: widget.habitat,
        profile: profile,
        action: action,
        reload: _loadReactions,
      ),
    );
  }

  String _actionName(HUGoalModel goal) {
    switch (goal.habit) {
      case 'Read':
        return 'read';
      case 'Exercise':
        return 'exercised';
      case 'Meditate':
        return 'meditated';
      default:
        return 'grew';
    }
  }
}
