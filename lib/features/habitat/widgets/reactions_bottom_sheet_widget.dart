import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../models/xmodels.dart';
import '../../../services/database.dart';

class ReactionsBottomSheetWidget extends ConsumerStatefulWidget {
  const ReactionsBottomSheetWidget({
    super.key,
    required this.habitat,
    required this.profile,
    required this.action,
    required this.reload,
  });

  final HUHabitatModel habitat;
  final HUProfileModel profile;
  final HUActionModel action;
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
    final alreadyReactions =
        await Database.myReactionsForAction(widget.action.id);

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

    return SafeArea(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 8.0,
          ),
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
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _reactions.length,
                  itemBuilder: (context, index) {
                    final reaction = _reactions[index];

                    bool alreadyReacted = false;
                    for (final r in _alreadyReactions) {
                      if (r.text == reaction.text) {
                        alreadyReacted = true;
                      }
                    }

                    return _loading
                        ? const CircularProgressIndicator.adaptive()
                        : ListTile(
                            enabled: alreadyReacted ? false : true,
                            onTap: () async {
                              // TODO: Add the reaction to the activity and close the sheet
                              final myReaction = reaction.copyWith(
                                ownerId: widget.profile.id,
                                createdAt: DateTime.now().toLocal(),
                                actionId: widget.action.id,
                              );

                              setState(() => _loading = true);

                              await Database.react(myReaction);

                              widget.reload();

                              setState(() => _loading = false);

                              if (context.mounted) {
                                context.pop();
                              }
                            },
                            leading: Text(
                              reaction.icon,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            title: Text(
                              reaction.text,
                              style: Theme.of(context).textTheme.titleMedium,
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
