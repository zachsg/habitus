import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../grow.dart';
import '../grow_stopwatch.dart';

class GrowStopwatchWidget extends ConsumerStatefulWidget {
  const GrowStopwatchWidget({
    super.key,
    required this.profile,
    required this.habitatAndAction,
  });

  final HUProfileModel profile;
  final HUHabitatAndActionModel habitatAndAction;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GrowStopwatchWidgetState();
}

class _GrowStopwatchWidgetState extends ConsumerState<GrowStopwatchWidget>
    with WidgetsBindingObserver {
  late Timer _timer;
  late GrowStopwatch _stopwatch;

  DateTime pausedTime = DateTime.now();
  DateTime resumedTime = DateTime.now();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    _stopwatch = GrowStopwatch()..start();

    var elapsed = 0;

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
    });

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        setState(() {
          pausedTime = DateTime.now();
          _stopwatch.stop();
        });
        break;
      case AppLifecycleState.resumed:
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
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            goalMetString,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            goalMetSubString,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          LottieBuilder.asset(
            'assets/gifs/hourglass.json',
            width: 164,
            height: 164,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
