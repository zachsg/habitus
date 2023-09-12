import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock/wakelock.dart';

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
    with WidgetsBindingObserver {
  late Timer _timer;
  late GrowStopwatch _stopwatch;

  DateTime pausedTime = DateTime.now();
  DateTime resumedTime = DateTime.now();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    _stopwatch = GrowStopwatch(
      initialOffset: Duration(minutes: widget.habitatAndAction.elapsed),
    )..start();

    final habitatIndex =
        widget.profile.habitats.indexOf(widget.habitatAndAction.habitat.id);
    final goal = widget.profile.goals[habitatIndex].value * 60;

    var elapsed = 0;

    final notificationSeconds = goal - (widget.habitatAndAction.elapsed * 60);
    if (notificationSeconds > 0) {
      LocalNotificationService().addNotification(
        '${_habitType()} Done',
        'You completed your ${_habitType().toLowerCase()} goal',
        DateTime.now().millisecondsSinceEpoch + (notificationSeconds * 1000),
        channel: _habitType().toLowerCase(),
      );
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (ref.watch(growProvider(widget.habitatAndAction)).isPaused) {
        _stopwatch
          ..stop()
          ..reset();
      } else {
        elapsed = _stopwatch.elapsed.inSeconds;
      }

      ref
          .read(growProvider(widget.habitatAndAction).notifier)
          .setElapsed(elapsed);

      if (goal <= elapsed) {
        widget.finished();
      }
    });

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        Wakelock.disable();
        setState(() {
          pausedTime = DateTime.now();
          _stopwatch.stop();
        });
        break;
      case AppLifecycleState.resumed:
        Wakelock.enable();

        final elapsed = _stopwatch.elapsed;

        setState(() {
          resumedTime = DateTime.now();
          final difference = resumedTime.difference(pausedTime);
          _stopwatch.reset(newInitialOffset: difference + elapsed);
          _stopwatch.start();
        });
        break;
      default:
    }
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final elapsed = ref.watch(growProvider(widget.habitatAndAction)).elapsed;
    final profile = ref.watch(profileProvider).profile;
    final habitatIndex =
        profile.habitats.indexOf(widget.habitatAndAction.habitat.id);
    final goal = profile.goals[habitatIndex].value * 60;

    final duration = goal * 1000 - widget.habitatAndAction.elapsed * 60 * 1000;

    final goneBy = goal - elapsed;

    if (goal <= elapsed) {
      _stopwatch.stop();
      _timer.cancel();
    }

    final minutes = goneBy / 60 > 0 ? goneBy ~/ 60 : 0;
    final seconds = minutes == 0 ? goneBy : goneBy - minutes * 60;
    final secondsText = seconds < 10 ? '0$seconds' : '$seconds';

    final isPaused = ref.watch(growProvider(widget.habitatAndAction)).isPaused;

    final habitatAndAction = widget.habitatAndAction;

    return Stack(
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
            : Positioned.fill(
                child: Align(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$minutes:$secondsText',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      habitatAndAction.elapsed == 0
                          ? const SizedBox()
                          : Text(
                              'You did ${habitatAndAction.elapsed} '
                              'min of your goal ealier today',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                    ],
                  ),
                ),
              ),
      ],
    );
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
}
