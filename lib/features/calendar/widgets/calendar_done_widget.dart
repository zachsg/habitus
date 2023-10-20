import 'package:flutter/material.dart';

class CalendarDoneWidget extends StatelessWidget {
  const CalendarDoneWidget({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.yellow.shade800,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            child: Container(
              width: 32.0,
              height: 32.0,
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
