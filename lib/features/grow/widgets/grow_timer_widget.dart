import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/extensions.dart';
import '../../../helpers/providers.dart';
import '../../../models/xmodels.dart';
import '../../../services/local_notification_service.dart';
import '../../profile/profile.dart';
import '../grow.dart';
import '../grow_stopwatch.dart';
import 'xwidgets.dart';

class GrowTimerWidget extends ConsumerStatefulWidget {
  const GrowTimerWidget({
    super.key,
    required this.profile,
    required this.habitatAndAction,
    required this.finished,
  });

  final HUProfileModel profile;
  final HUHabitatAndActionModel habitatAndAction;
  final VoidCallback finished;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CountDownWidgetState();
}

class _CountDownWidgetState extends ConsumerState<GrowTimerWidget>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  late Timer _timer;
  late GrowStopwatch _stopwatch;
  late AnimationController _controller;
  bool _isInactive = false;
  bool _goalComplete = false;

  DateTime _pausedTime = DateTime.now();
  DateTime _resumedTime = DateTime.now();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _stopwatch = GrowStopwatch(
      initialOffset: Duration(minutes: widget.habitatAndAction.elapsed),
    )..start();

    final goal = widget.profile.goals.firstWhere(
        (goal) => goal.habitatId == widget.habitatAndAction.habitat.id);
    final goalValue = goal.value * 60;

    var elapsed = 0;

    final habitType = widget.habitatAndAction.habitat.goal.habit;

    final notificationSeconds =
        goalValue - (widget.habitatAndAction.elapsed * 60);
    if (notificationSeconds > 0) {
      LocalNotificationService().addNotification(
        '${habitType.habitDoing()} Done',
        'You completed your ${habitType.habitDoing().toLowerCase()} goal',
        DateTime.now().millisecondsSinceEpoch + (notificationSeconds * 1000),
        channel: habitType.habitDoing().toLowerCase(),
      );
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (ref.watch(growProvider(widget.habitatAndAction)).isPaused) {
        _stopwatch
          ..stop()
          ..reset();
      } else {
        elapsed = _stopwatch.elapsed.inSeconds;
        ref
            .read(growProvider(widget.habitatAndAction).notifier)
            .setAlreadyElapsed(elapsed - widget.habitatAndAction.elapsed * 60);
      }

      ref
          .read(growProvider(widget.habitatAndAction).notifier)
          .setElapsed(elapsed);

      if (goalValue <= elapsed) {
        setState(() => _goalComplete = true);
        widget.finished();
      }

      if (!_isInactive) {
        _pausedTime = DateTime.now();
      }
    });

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
        _stopwatch.stop();
        _isInactive = true;
        break;
      case AppLifecycleState.resumed:
        _isInactive = false;
        _resumedTime = DateTime.now();
        final elapsed = _stopwatch.elapsed;
        final difference = _resumedTime.difference(_pausedTime);
        setState(() {
          _stopwatch.reset(newInitialOffset: difference + elapsed);
          _stopwatch.start();
        });
        break;
      default:
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopwatch.stop();
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeP = ref.watch(themeProvider);

    final elapsed = ref.watch(growProvider(widget.habitatAndAction)).elapsed;
    final profile = ref.watch(profileProvider).profile;
    final goal = profile.goals.firstWhere(
        (goal) => goal.habitatId == widget.habitatAndAction.habitat.id);
    final goalValue = goal.value * 60;

    final duration =
        goalValue * 1000 - widget.habitatAndAction.elapsed * 60 * 1000;

    final goneBy = goalValue - elapsed;

    if (goalValue <= elapsed) {
      _stopwatch.stop();
      _timer.cancel();
    }

    final minutes = goneBy / 60 > 0 ? goneBy ~/ 60 : 0;
    final seconds = minutes == 0 ? goneBy : goneBy - minutes * 60;
    final secondsText = seconds < 10 ? '0$seconds' : '$seconds';

    final isPaused = ref.watch(growProvider(widget.habitatAndAction)).isPaused;

    final habitatAndAction = widget.habitatAndAction;

    return _goalComplete
        ? GrowStopwatchWidget(
            profile: widget.profile,
            habitatAndAction: widget.habitatAndAction,
          )
        : Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GrowCircleWidget(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  milliseconds: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GrowCircleWidget(
                  color: Theme.of(context).colorScheme.primary,
                  milliseconds: duration,
                ),
              ),
              isPaused
                  ? const SizedBox()
                  : AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return themeP.minimalTimer()
                            ? const SizedBox()
                            : Positioned.fill(
                                child: Align(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '$minutes:$secondsText',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                      habitatAndAction.elapsed == 0
                                          ? const SizedBox()
                                          : Text(
                                              'You did ${habitatAndAction.elapsed.toTimeLong()} '
                                              'of your goal earlier today',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            )
                                    ],
                                  ),
                                ),
                              );
                      },
                    ),
            ],
          );
  }
}
