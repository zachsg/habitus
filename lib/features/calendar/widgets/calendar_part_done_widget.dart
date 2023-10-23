import 'package:flutter/material.dart';

class CalendarPartDoneWidget extends StatelessWidget {
  const CalendarPartDoneWidget({
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
        Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              day.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
      ],
    );
  }
}
