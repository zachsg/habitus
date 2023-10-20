import 'package:flutter/material.dart';

class HabitatsPartDoneWidget extends StatelessWidget {
  const HabitatsPartDoneWidget({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 21.0,
          height: 21.0,
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
