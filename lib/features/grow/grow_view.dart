import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../helpers/providers.dart';
import '../../models/xmodels.dart';
import '../../helpers/strings.dart';
import '../../services/local_notification_service.dart';
import '../../services/remote_notification_service.dart';
import '../habitat/habitat.dart';
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

    final themeP = ref.watch(themeProvider);

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final isIOS = Platform.isIOS;

    final icon = isIOS ? CupertinoIcons.eye_slash : Icons.visibility_off;
    final iconMinimal = isIOS ? CupertinoIcons.eye_fill : Icons.visibility;

    return WillPopScope(
      onWillPop: () => saveOrDelete(ref, context, goalMet),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: themeP.minimalTimer()
                ? isDark
                    ? null
                    : Theme.of(context).colorScheme.onPrimaryContainer
                : null,
            appBar: AppBar(
              foregroundColor: themeP.minimalTimer()
                  ? Colors.white.withOpacity(0.8)
                  : Theme.of(context).colorScheme.onBackground,
              backgroundColor: themeP.minimalTimer()
                  ? isDark
                      ? null
                      : Theme.of(context).colorScheme.onPrimaryContainer
                  : null,
              title: Text(
                _habitType(),
              ),
              actions: [
                IconButton(
                  padding: const EdgeInsets.all(12.0),
                  onPressed: themeP.toggleMinimalTimer,
                  icon: Icon(
                    themeP.minimalTimer() ? iconMinimal : icon,
                    color: themeP.minimalTimer()
                        ? isDark
                            ? Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).colorScheme.background
                        : null,
                    size: 32,
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
                const SizedBox(height: 16.0),
                FilledButton(
                  onPressed: () {
                    WakelockPlus.disable();
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 20.0,
                    ),
                    child: Text(goalMet ? pauseString : 'Done ${_habitType()}'),
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
    WakelockPlus.disable();

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
      AudioPlayer().play(AssetSource('sounds/singing-bowl.mp3'), volume: 0.5);

  Future<void> _showSessionCompleteDialog(
    WidgetRef ref,
    BuildContext context,
    HUHabitatAndActionModel habitatAndAction,
    bool goalMet,
  ) async {
    final grow = ref.watch(growProvider(habitatAndAction));
    bool loading = false;

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
          content: StatefulBuilder(builder: (context, setState) {
            return const SingleChildScrollView(
              child: ListBody(
                children: [],
              ),
            );
          }),
          actions: [
            loading
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator.adaptive(),
                    ],
                  )
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
                          WakelockPlus.disable();

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
                          setState(() => loading = true);

                          WakelockPlus.disable();

                          LocalNotificationService()
                              .cancelNotificationWithId(0);

                          await ref
                              .read(growProvider(habitatAndAction).notifier)
                              .save(goalMet);

                          _notifyNewAction();

                          setState(() => loading = false);

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

  Future<void> _notifyNewAction() async {
    final profiles = ref
        .watch(habitatProvider(widget.habitatAndAction.habitat))
        .profiles
        .toList();
    final profile = ref.watch(profileProvider).profile;

    profiles.removeWhere((p) => p.id == profile.id || p.pushToken.isEmpty);

    final habitat = widget.habitatAndAction.habitat;
    final title = habitat.name;
    final subtitle =
        '@${profile.handle} just finished ${_habitType().toLowerCase()}';

    List<String> tokens = [];
    for (final profile in profiles) {
      tokens.add(profile.pushToken);
    }

    await RemoteNotificationService.newActionNotification(
      tokens: tokens,
      title: title,
      subtitle: subtitle,
    );
  }
}
