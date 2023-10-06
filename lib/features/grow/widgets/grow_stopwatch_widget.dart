import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/providers.dart';
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
  final _isIOS = Platform.isIOS;
  late Timer _timer;
  late GrowStopwatch _stopwatch;

  bool _isInactive = false;
  DateTime _pausedTime = DateTime.now();
  DateTime _resumedTime = DateTime.now();

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

      if (!_isInactive) {
        _pausedTime = DateTime.now();
      }
      ;
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeP = ref.watch(themeProvider);

    final grow = ref.watch(growProvider(widget.habitatAndAction));
    final minutes = grow.elapsed / 60 > 0 ? grow.elapsed ~/ 60 : 0;
    final seconds = minutes == 0 ? grow.elapsed : grow.elapsed - minutes * 60;
    final secondsText = seconds < 10 ? '0$seconds' : '$seconds';

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            goalMetString,
            textAlign: TextAlign.center,
            style: themeP.minimalTimer()
                ? Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.bold)
                : Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            goalMetSubString,
            textAlign: TextAlign.center,
            style: themeP.minimalTimer()
                ? Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white.withOpacity(0.7))
                : Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Icon(
            _isIOS ? CupertinoIcons.stopwatch : Icons.timer_outlined,
            size: 128.0,
            color: themeP.minimalTimer()
                ? Colors.white.withOpacity(0.7)
                : Theme.of(context).colorScheme.onBackground,
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Elapsed:',
                style: themeP.minimalTimer()
                    ? Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white.withOpacity(0.7),
                        )
                    : Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 4),
              Text(
                '$minutes:$secondsText',
                style: themeP.minimalTimer()
                    ? Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.bold)
                    : Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
