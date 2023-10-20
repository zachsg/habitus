import 'package:flutter/material.dart';

class CalendarDoneWidget extends StatelessWidget {
  const CalendarDoneWidget({
    super.key,
    required this.day,
    this.width = 50.0,
    this.height = 50.0,
  });

  final String day;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.yellow.shade800,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            child: Container(
              width: width * 0.64,
              height: height * 0.64,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  day.toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
