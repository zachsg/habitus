import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock/wakelock.dart';

import '../../models/xmodels.dart';
import '../../helpers/strings.dart';
import '../../services/local_notification_service.dart';
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
    final goal = profile.goals
        .firstWhere((goal) => goal.habitatId == habitatAndAction.habitat.id);

    final goalMet = habitatAndAction.elapsed >= goal.value;

    return WillPopScope(
      onWillPop: () => saveOrDelete(ref, context, goalMet),
      child: Scaffold(
        appBar: AppBar(
          title: Text(_habitType()),
        ),
        body: Column(
          children: [
            goalMet
                ? GrowStopwatchWidget(
                    profile: profile,
                    habitatAndAction: habitatAndAction,
                  )
                : GrowTimerWidget(
                    profile: profile,
                    habitatAndAction: habitatAndAction,
                    finished: () {
                      ref
                          .read(growProvider(habitatAndAction).notifier)
                          .setPaused(true);

                      _playTone();

                      _showSessionCompleteDialog(
                        ref,
                        context,
                        habitatAndAction,
                        goalMet,
                      );
                    },
                  ),
            ElevatedButton(
              onPressed: () {
                Wakelock.disable();
                ref
                    .read(growProvider(habitatAndAction).notifier)
                    .setPaused(true);

                _showSessionCompleteDialog(
                  ref,
                  context,
                  habitatAndAction,
                  goalMet,
                );
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

  Future<bool> saveOrDelete(
      WidgetRef ref, BuildContext context, bool goalMet) async {
    Wakelock.disable();
    ref.read(growProvider(habitatAndAction).notifier).setPaused(true);
    _showSessionCompleteDialog(
      ref,
      context,
      habitatAndAction,
      goalMet,
    );
    return true;
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
    bool goalMet,
  ) async {
    final grow = ref.watch(growProvider(habitatAndAction));

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        final elapsed = goalMet
            ? grow.elapsed / 60
            : grow.elapsed / 60 - habitatAndAction.elapsed;

        return AlertDialog(
          title: Text(
            'You ${_habitTypePast().toLowerCase()} '
            'for ${elapsed.round()} '
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

                          LocalNotificationService()
                              .cancelNotificationWithId(0);

                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
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

                          LocalNotificationService()
                              .cancelNotificationWithId(0);

                          await ref
                              .read(growProvider(habitatAndAction).notifier)
                              .save(goalMet);

                          if (context.mounted) {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
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
