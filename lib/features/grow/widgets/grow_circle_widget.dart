import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GrowCircleWidget extends ConsumerStatefulWidget {
  const GrowCircleWidget({
    super.key,
    required this.color,
    required this.milliseconds,
  });

  final Color color;
  final int milliseconds;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CircleState();
}

class _CircleState extends ConsumerState<GrowCircleWidget>
    with SingleTickerProviderStateMixin {
  double _fraction = 0.0;
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: widget.milliseconds),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _fraction = _animation.value;
        });
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: CustomPaint(
            painter: CirclePainter(
              fraction: _fraction,
              color: widget.color,
            ),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double fraction;
  final Color color;
  late Paint _circlePaint;
  final double pi = 3.1415926535897932;

  CirclePainter({required this.fraction, required this.color}) {
    _circlePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30.0
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var rect = const Offset(0.0, 0.0) & size;

    canvas.drawArc(rect, -pi / 2, pi * 2 * fraction, false, _circlePaint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.fraction != fraction;
  }
}
