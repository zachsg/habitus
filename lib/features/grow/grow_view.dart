import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock/wakelock.dart';

import '../../helpers/app_colors.dart';
import '../../helpers/providers.dart';
import '../../models/xmodels.dart';
import '../../helpers/strings.dart';
import '../../services/local_notification_service.dart';
import '../profile/profile.dart';
import 'grow.dart';
import 'widgets/xwidgets.dart';

class GrowView extends ConsumerStatefulWidget {
  const GrowView({super.key, required this.habitatAndAction});

  final HUHabitatAndActionModel habitatAndAction;

  static const routeName = 'grow';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GrowViewState();
}

class _GrowViewState extends ConsumerState<GrowView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider).profile;
    final goal = profile.goals.firstWhere(
        (goal) => goal.habitatId == widget.habitatAndAction.habitat.id);

    final goalMet = widget.habitatAndAction.elapsed >= goal.value;

    final theme = ref.watch(themeServiceProvider);

    return WillPopScope(
      onWillPop: () => saveOrDelete(ref, context, goalMet),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: theme.minimalTimer() ? AppColors.minimal : null,
            appBar: AppBar(
              backgroundColor: theme.minimalTimer() ? AppColors.minimal : null,
              title: Text(_habitType()),
              actions: [
                IconButton(
                  onPressed: theme.toggleMinimalTimer,
                  icon: Icon(
                    theme.minimalTimer() ? Icons.light_mode : Icons.dark_mode,
                    color: Theme.of(context).colorScheme.primary,
                    size: 48,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                goalMet
                    ? GrowStopwatchWidget(
                        profile: profile,
                        habitatAndAction: widget.habitatAndAction,
                      )
                    : GrowTimerWidget(
                        profile: profile,
                        habitatAndAction: widget.habitatAndAction,
                        finished: () {
                          ref
                              .read(growProvider(widget.habitatAndAction)
                                  .notifier)
                              .setPaused(true);

                          _playTone();

                          _showSessionCompleteDialog(
                            ref,
                            context,
                            widget.habitatAndAction,
                            goalMet,
                          );
                        },
                      ),
                ElevatedButton(
                  onPressed: () {
                    Wakelock.disable();
                    ref
                        .read(growProvider(widget.habitatAndAction).notifier)
                        .setPaused(true);

                    _showSessionCompleteDialog(
                      ref,
                      context,
                      widget.habitatAndAction,
                      goalMet,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 20.0,
                    ),
                    child: Text(pauseString),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<bool> saveOrDelete(
    WidgetRef ref,
    BuildContext context,
    bool goalMet,
  ) async {
    Wakelock.disable();

    ref.read(growProvider(widget.habitatAndAction).notifier).setPaused(true);

    _showSessionCompleteDialog(
      ref,
      context,
      widget.habitatAndAction,
      goalMet,
    );

    return true;
  }

  String _habitType() {
    switch (widget.habitatAndAction.habitat.goal.habit) {
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
    switch (widget.habitatAndAction.habitat.goal.habit) {
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
