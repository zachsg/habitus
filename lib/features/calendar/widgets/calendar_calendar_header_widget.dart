import 'package:flutter/material.dart';

class CalendarCalendarHeaderWidget extends StatelessWidget {
  const CalendarCalendarHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Su'),
          Text('Mo'),
          Text('Tu'),
          Text('We'),
          Text('Th'),
          Text('Fr'),
          Text('Sa'),
        ],
      ),
    );
  }
}
