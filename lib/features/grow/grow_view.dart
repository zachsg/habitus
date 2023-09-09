import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wakelock/wakelock.dart';

import '../../models/xmodels.dart';
import '../../helpers/strings.dart';
import '../habitat/habitat_view.dart';
import '../profile/profile.dart';
import 'grow.dart';
import 'widgets/xwidgets.dart';

class GrowView extends ConsumerWidget {
  const GrowView({super.key, required this.habitatAndAction});

  final HUHabitatAndActionModel habitatAndAction;

  static const routeName = 'grow';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider).profile;

    Future<bool> saveOrDelete() async {
      Wakelock.disable();
      ref.read(growProvider(habitatAndAction).notifier).setPaused(true);
      _showSessionCompleteDialog(ref, context, habitatAndAction);
      return true;
    }

    return WillPopScope(
      onWillPop: saveOrDelete,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_habitType()),
        ),
        body: Column(
          children: [
            GrowTimerWidget(
              profile: profile,
              habitatAndAction: habitatAndAction,
              finished: () {
                ref
                    .read(growProvider(habitatAndAction).notifier)
                    .setPaused(true);
                _showSessionCompleteDialog(ref, context, habitatAndAction);
              },
            ),
            ElevatedButton(
              onPressed: () {
                Wakelock.disable();
                ref
                    .read(growProvider(habitatAndAction).notifier)
                    .setPaused(true);
                _showSessionCompleteDialog(ref, context, habitatAndAction);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Text('$pauseString ${_habitType()}'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _habitType() {
    switch (habitatAndAction.habitat.goal.habit) {
      case 'Read':
        return 'Reading';
      case 'Exercise':
        return 'Exercising';
      case 'Meditate':
        return 'Meditating';
      default:
        return 'Growing';
    }
  }

  String _habitTypePast() {
    switch (habitatAndAction.habitat.goal.habit) {
      case 'Read':
        return 'Read';
      case 'Exercise':
        return 'Exercised';
      case 'Meditate':
        return 'Meditated';
      default:
        return 'Grew';
    }
  }

  Future<void> _playTone() async =>
      AudioPlayer().play(AssetSource('sounds/singing-bowl.mp3'));

  Future<void> _showSessionCompleteDialog(
    WidgetRef ref,
    BuildContext context,
    HUHabitatAndActionModel habitatAndAction,
  ) async {
    final grow = ref.watch(growProvider(habitatAndAction));

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'You ${_habitTypePast().toLowerCase()} '
            'for ${(grow.elapsed / 60 - habitatAndAction.elapsed).round()} '
            '${habitatAndAction.habitat.goal.unit.name}',
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [],
            ),
          ),
          actions: [
            grow.loading
                ? const CircularProgressIndicator.adaptive()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        child: Text(
                          'Delete',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.error),
                        ),
                        onPressed: () {
                          Wakelock.disable();
                          Navigator.of(context).pop();
                          context.goNamed(
                            HabitatView.routeName,
                            pathParameters: {
                              'id': habitatAndAction.habitat.id.toString(),
                            },
                            extra: habitatAndAction.habitat,
                          );
                        },
                      ),
                      TextButton(
                        child: Text(
                          'Save',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        onPressed: () async {
                          Wakelock.disable();
                          await ref
                              .read(growProvider(habitatAndAction).notifier)
                              .save();

                          if (context.mounted) {
                            Navigator.of(context).pop();

                            Navigator.of(context).pop();
                            // context.goNamed(
                            //   HabitatView.routeName,
                            //   pathParameters: {
                            //     'id': habitatAndAction.habitat.id.toString()
                            //   },
                            //   extra: habitatAndAction.habitat,
                            // );
                          }
                        },
                      ),
                    ],
                  ),
          ],
        );
      },
    );
  }
}
