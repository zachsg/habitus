import 'package:flutter/material.dart';

class CalendarNotDoneWidget extends StatelessWidget {
  const CalendarNotDoneWidget({
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
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Center(
        child: Text(
          day.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
