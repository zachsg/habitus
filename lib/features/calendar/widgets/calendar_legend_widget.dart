import 'package:flutter/material.dart';

import 'xwidgets.dart';

class CalendarLegendWidget extends StatelessWidget {
  const CalendarLegendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CalendarNotDoneWidget(
                day: '',
                width: 32.0,
                height: 32.0,
              ),
              SizedBox(width: 8.0),
              Text('Your habit misses you'),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            children: [
              CalendarPartDoneWidget(
                day: '',
                width: 32.0,
                height: 32.0,
              ),
              SizedBox(width: 8.0),
              Text('You made progress'),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            children: [
              CalendarDoneWidget(
                day: '',
                width: 32.0,
                height: 32.0,
              ),
              SizedBox(width: 8.0),
              Text('Goal completed or exceeded'),
            ],
          ),
        ],
      ),
    );
  }
}
