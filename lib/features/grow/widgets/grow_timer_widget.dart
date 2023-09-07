import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/xmodels.dart';
import '../../../services/local_notification_service.dart';
import '../../profile/profile.dart';
import '../grow.dart';
import 'xwidgets.dart';

class GrowTimerWidget extends ConsumerStatefulWidget {
  const GrowTimerWidget(
      {super.key,
      required this.profile,
      required this.habitat,
      required this.finished});

  final HUProfileModel profile;
  final HUHabitatModel habitat;
  final VoidCallback finished;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CountDownWidgetState();
}

class _CountDownWidgetState extends ConsumerState<GrowTimerWidget> {
  late Timer _timer;
  late Stopwatch _stopwatch;

  @override
  void initState() {
    _stopwatch = Stopwatch()..start();

    final habitatIndex = widget.profile.habitats.indexOf(widget.habitat.id);
    final goal = widget.profile.goals[habitatIndex].value * 60;

    var elapsed = 0;

    LocalNotificationService().addNotification(
      'Meditation Done',
      'You completed your meditation goal',
      DateTime.now().millisecondsSinceEpoch + (goal * 1000),
      channel: 'meditation',
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (ref.watch(growProvider(widget.habitat)).isPaused) {
        _stopwatch
          ..stop()
          ..reset();
      } else {
        elapsed = _stopwatch.elapsed.inSeconds;
      }

      ref.read(growProvider(widget.habitat).notifier).setElapsed(elapsed);

      if (goal <= elapsed) {
        widget.finished();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final elapsed = ref.watch(growProvider(widget.habitat)).elapsed;
    final profile = ref.watch(profileProvider).profile;
    final habitatIndex = profile.habitats.indexOf(widget.habitat.id);
    final goal = profile.goals[habitatIndex].value * 60;
    final duration = goal * 1000;

    final goneBy = goal - elapsed;

    if (goal <= elapsed) {
      _stopwatch.stop();
      _timer.cancel();
    }

    final minutes = goneBy / 60 > 0 ? goneBy ~/ 60 : 0;
    final seconds = minutes == 0 ? goneBy : goneBy - minutes * 60;
    final secondsText = seconds < 10 ? '0$seconds' : '$seconds';

    final isPaused = ref.watch(growProvider(widget.habitat)).isPaused;

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
                  child: Text(
                    '$minutes:$secondsText',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
      ],
    );
  }
}
