import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../habitat.dart';

class HabitatCalloutBoxWidget extends ConsumerWidget {
  const HabitatCalloutBoxWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitatP = ref.watch(habitatProvider(habitat));
    final profiles = habitatP.profiles;
    final callouts = habitatP.callouts;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            habitatCalloutString.toUpperCase(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.7),
                  width: 2.0),
            ),
            child: InkWell(
              onTap: () => _showSessionCompleteDialog(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _calloutBadges(profiles, callouts),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _calloutBadges(
    List<HUProfileModel> profiles,
    List<HUCalloutModel> callouts,
  ) {
    List<Widget> children = [];

    final calloutsNotDone = callouts.toList();
    calloutsNotDone.removeWhere((callout) => callout.done);

    final Set<String> calloutIds = {};
    for (final callout in calloutsNotDone) {
      calloutIds.add(callout.callee);
    }

    final List<String> calloutIdsAll = [];
    for (final callout in calloutsNotDone) {
      calloutIdsAll.add(callout.callee);
    }

    for (final calloutId in calloutIds) {
      final profile = profiles.firstWhere(
        (p) => p.id == calloutId,
        orElse: () => HUProfileModel(
          id: '-1',
          handle: 'redacted',
          updatedAt: DateTime.now(),
        ),
      );

      int count = 0;
      for (final id in calloutIdsAll) {
        if (id == profile.id) {
          count += 1;
        }
      }

      final index = profiles.indexOf(profile);

      final badge = CalloutBadgeMember(
        text: 'x$count',
        handle: profile.handle,
        index: index,
      );
      children.add(badge);
    }

    return children;
  }

  Future<void> _showSessionCompleteDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(calloutDialogTitleString),
          content: StatefulBuilder(builder: (context, setState) {
            return const Text(calloutDialogBodyString);
          }),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: context.pop,
                  child: Text(
                    calloutDialogDoneString,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class CalloutBadgeMember extends ConsumerWidget {
  const CalloutBadgeMember({
    super.key,
    required this.text,
    this.handle = '',
    required this.index,
  });

  final String text;
  final String handle;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
              border: Border.all(
                  width: 2, color: Theme.of(context).colorScheme.onBackground),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.2),
                  offset: const Offset(3, 3),
                  blurRadius: 3,
                ),
              ],
            ),
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Text(text),
            ),
          ),
          Text(
            '@$handle',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
