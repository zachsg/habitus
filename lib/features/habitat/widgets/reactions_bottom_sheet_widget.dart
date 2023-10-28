import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../models/xmodels.dart';
import '../../../services/database.dart';
import '../../../services/remote_notification_service.dart';
import '../../profile/profile.dart';
import '../habitat.dart';

class ReactionsBottomSheetWidget extends ConsumerStatefulWidget {
  const ReactionsBottomSheetWidget({
    super.key,
    required this.habitat,
    required this.profile,
    required this.activity,
    required this.reload,
  });

  final HUHabitatModel habitat;
  final HUProfileModel profile;
  final Object activity;
  final VoidCallback reload;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ReactionsBottomSheetWidgetState();
}

class _ReactionsBottomSheetWidgetState
    extends ConsumerState<ReactionsBottomSheetWidget> {
  final List<HUReactionModel> _reactions = [];
  final List<HUReactionModel> _alreadyReactions = [];
  bool _loading = true;

  @override
  void initState() {
    _loadPossibleReactions();
    super.initState();
  }

  Future<void> _loadPossibleReactions() async {
    final reactions = await Database.possibleReactions([]);
    List<HUReactionModel> alreadyReactions = [];

    if (widget.activity is HUActionModel) {
      final id = (widget.activity as HUActionModel).id;
      alreadyReactions = await Database.myReactionsForActivity(id);
    } else if (widget.activity is HUCalloutModel) {
      final id = (widget.activity as HUCalloutModel).id;
      alreadyReactions = await Database.myReactionsForActivity(id);
    }

    _reactions.clear();
    _alreadyReactions.clear();

    setState(() {
      _reactions.addAll(reactions);
      _alreadyReactions.addAll(alreadyReactions);
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    const title = 'Add Reaction';

    bool isCallout = widget.activity is HUCalloutModel;

    final profile = ref.watch(profileProvider).profile;
    final isMyAction = isCallout
        ? profile.id == (widget.activity as HUCalloutModel).caller
        : profile.id == (widget.activity as HUActionModel).ownerId;

    if (!isMyAction) {
      _reactions.removeWhere((reaction) => reaction.actionId == 1);
    }

    return SafeArea(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 8.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      IconButton(
                        onPressed: Navigator.of(context).pop,
                        icon: const Icon(
                          Icons.cancel_outlined,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: _loading
                      ? const CircularProgressIndicator.adaptive()
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _reactions.length + 1,
                          itemBuilder: (context2, index) {
                            if (index == 0) {
                              return HabitatCustomReactionTextFieldWidget(
                                habitat: widget.habitat,
                                onFinished: () async {
                                  setState(() => _loading = true);

                                  final reaction = HUReactionModel(
                                    id: -1,
                                    ownerId: profile.id,
                                    createdAt: DateTime.now(),
                                    text: ref
                                        .read(habitatProvider(widget.habitat))
                                        .customReactionText,
                                  );

                                  final isCallout =
                                      (widget.activity is HUCalloutModel);

                                  final myReaction = isCallout
                                      ? reaction.copyWith(
                                          ownerId: widget.profile.id,
                                          createdAt: DateTime.now().toLocal(),
                                          calloutId: (widget.activity
                                                  as HUCalloutModel)
                                              .id,
                                        )
                                      : reaction.copyWith(
                                          ownerId: widget.profile.id,
                                          createdAt: DateTime.now().toLocal(),
                                          actionId:
                                              (widget.activity as HUActionModel)
                                                  .id,
                                        );

                                  await Database.react(myReaction);

                                  final actionProfile = ref
                                      .read(habitatProvider(widget.habitat))
                                      .profiles
                                      .firstWhere((profile) => isCallout
                                          ? profile.id ==
                                              (widget.activity
                                                      as HUCalloutModel)
                                                  .caller
                                          : profile.id ==
                                              (widget.activity as HUActionModel)
                                                  .ownerId);

                                  final token = actionProfile.pushToken;
                                  final title = widget.habitat.name;
                                  final subtitle =
                                      '@${profile.handle} just reacted to your activity with \'${reaction.text}\'';

                                  await RemoteNotificationService
                                      .newReactionNotification(
                                    token: token,
                                    title: title,
                                    subtitle: subtitle,
                                    habitat: widget.habitat,
                                  );

                                  widget.reload();

                                  setState(() => _loading = false);

                                  if (context.mounted) {
                                    context.pop();
                                  }
                                },
                              );
                            } else {
                              final reaction = _reactions[index - 1];

                              bool alreadyReacted = false;
                              for (final r in _alreadyReactions) {
                                if (r.text == reaction.text) {
                                  alreadyReacted = true;
                                }
                              }

                              return ListTile(
                                enabled: alreadyReacted ? false : true,
                                onTap: () async {
                                  // TODO: Add the reaction to the activity and close the sheet
                                  final isCallout =
                                      (widget.activity is HUCalloutModel);
                                  final myReaction = isCallout
                                      ? reaction.copyWith(
                                          ownerId: widget.profile.id,
                                          createdAt: DateTime.now().toLocal(),
                                          calloutId: (widget.activity
                                                  as HUCalloutModel)
                                              .id,
                                        )
                                      : reaction.copyWith(
                                          ownerId: widget.profile.id,
                                          createdAt: DateTime.now().toLocal(),
                                          actionId:
                                              (widget.activity as HUActionModel)
                                                  .id,
                                        );

                                  setState(() => _loading = true);

                                  await Database.react(myReaction);

                                  final actionProfile = ref
                                      .read(habitatProvider(widget.habitat))
                                      .profiles
                                      .firstWhere((profile) => isCallout
                                          ? profile.id ==
                                              (widget.activity
                                                      as HUCalloutModel)
                                                  .caller
                                          : profile.id ==
                                              (widget.activity as HUActionModel)
                                                  .ownerId);

                                  final token = actionProfile.pushToken;
                                  final title = widget.habitat.name;
                                  final subtitle =
                                      '@${profile.handle} just reacted to your activity with \'${reaction.text}\'';

                                  await RemoteNotificationService
                                      .newReactionNotification(
                                    token: token,
                                    title: title,
                                    subtitle: subtitle,
                                    habitat: widget.habitat,
                                  );

                                  widget.reload();

                                  setState(() => _loading = false);

                                  if (context.mounted) {
                                    context.pop();
                                  }
                                },
                                // leading: Text(
                                //   reaction.icon,
                                //   style: Theme.of(context).textTheme.titleLarge,
                                // ),
                                title: Text(
                                  reaction.text,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                subtitle: reaction.actionId == 1
                                    ? Row(
                                        children: [
                                          Container(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(
                                                'Self Pat'.toUpperCase(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onTertiary),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : reaction.actionId == 2
                                        ? Row(
                                            children: [
                                              Container(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8.0),
                                                  child: Text(
                                                    'Pat Pat'.toUpperCase(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onPrimary),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8.0),
                                                  child: Text(
                                                    'Smack Pat'.toUpperCase(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onError),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                trailing: Icon(
                                  size: 28.0,
                                  color: Theme.of(context).colorScheme.primary,
                                  isIOS
                                      ? alreadyReacted
                                          ? CupertinoIcons.check_mark
                                          : CupertinoIcons.add_circled
                                      : alreadyReacted
                                          ? Icons.check_circle
                                          : Icons.add_circle,
                                ),
                              );
                            }
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HabitatCustomReactionTextFieldWidget extends ConsumerStatefulWidget {
  const HabitatCustomReactionTextFieldWidget({
    super.key,
    required this.habitat,
    required this.onFinished,
  });

  final HUHabitatModel habitat;

  final VoidCallback onFinished;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HabitatCustomReactionTextFieldWidgetState();
}

class _HabitatCustomReactionTextFieldWidgetState
    extends ConsumerState<HabitatCustomReactionTextFieldWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    return ListTile(
      title: TextField(
        controller: _controller,
        keyboardType: TextInputType.text,
        minLines: 1,
        maxLines: 4,
        maxLength: 80,
        decoration: const InputDecoration(
          labelText: 'Custom Reaction',
          hintText: 'Type a custom reaction',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
        ),
        onChanged: (text) => ref
            .read(habitatProvider(widget.habitat).notifier)
            .setCustomReactionText(text),
        onSubmitted: (text) => text.isEmpty ? null : widget.onFinished(),
      ),
      trailing: GestureDetector(
        onTap: () => widget.onFinished(),
        child: Icon(
          size: 28.0,
          color: Theme.of(context).colorScheme.primary,
          isIOS ? CupertinoIcons.add_circled : Icons.add_circle,
        ),
      ),
    );
  }
}
