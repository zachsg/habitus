import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../models/xmodels.dart';
import 'calendar.dart';
import 'widgets/xwidgets.dart';

class CalendarView extends ConsumerStatefulWidget {
  const CalendarView({super.key, required this.habitats});

  final List<HUHabitatModel> habitats;

  static const routeName = 'calendar';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarViewState();
}

class _CalendarViewState extends ConsumerState<CalendarView> {
  @override
  void initState() {
    ref.read(calendarProvider(widget.habitats).notifier).loadActions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress'),
        actions: [
          IconButton(
            onPressed: () => _showInfoDialog(context),
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          CalendarHabitatPickerWidget(habitats: widget.habitats),
          Column(
            children: [
              CalendarMonthPickerWidget(habitats: widget.habitats),
              const CalendarCalendarHeaderWidget(),
              CalendarCalendarWidget(habitats: widget.habitats),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _showInfoDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Legend'),
          content: StatefulBuilder(builder: (context, setState) {
            return const CalendarLegendWidget();
          }),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: context.pop,
                  child: Text(
                    'Got It',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
