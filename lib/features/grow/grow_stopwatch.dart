class GrowStopwatch extends Stopwatch {
  final Stopwatch _stopWatch = Stopwatch();
  Duration _initialOffset;

  GrowStopwatch({Duration initialOffset = Duration.zero})
      : _initialOffset = initialOffset;

  @override
  start() => _stopWatch.start();

  @override
  stop() => _stopWatch.stop();

  @override
  reset({Duration newInitialOffset = Duration.zero}) {
    _stopWatch.reset();
    _initialOffset = newInitialOffset;
  }

  @override
  Duration get elapsed => _stopWatch.elapsed + _initialOffset;
}
