import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../models/xmodels.dart';
import '../../profile/profile.dart';
import '../calendar.dart';
import 'xwidgets.dart';

class CalendarCalendarWidget extends ConsumerWidget {
  const CalendarCalendarWidget({super.key, required this.habitats});

  final List<HUHabitatModel> habitats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(calendarProvider(habitats));
    final profile = ref.read(profileProvider).profile;
    final goal = profile.goals.firstWhere(
      (goal) => goal.habitatId == provider.habitat.id,
      orElse: () =>
          HUGoalModel(habitatId: -1, habit: '', unit: Unit.minutes, value: 0),
    );

    final firstDayOfMonth = DateTime(
      provider.date.year,
      provider.date.month,
      1,
    );

    final lastDayOfMonth = DateTime(
      provider.date.year,
      provider.date.month + 1,
      0,
    );

    int count = 0;

    final List<HUActionModel> actions = List.from(provider.actions);
    actions.removeWhere((action) =>
        action.habitatId != provider.habitat.id ||
        action.createdAt.month != provider.date.month);

    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          crossAxisCount: 7,
          // childAspectRatio: 0.85,
        ),
        itemCount: lastDayOfMonth.day + _extraItemCount(firstDayOfMonth),
        itemBuilder: (context, index) {
          if (count < _extraItemCount(firstDayOfMonth)) {
            count += 1;
            return const Text('');
          } else {
            final dayNumber = index + 1 - count;
            int youDid = 0;
            final d = provider.date.copyWith(day: dayNumber);
            final today = DateTime.now();
            if (d.isBefore(today)) {
              for (final action in actions) {
                if (action.createdAt.toLocal().day == d.day) {
                  youDid += action.goal.value;
                }
              }
            }

            if (youDid >= goal.value) {
              return CalendarDoneWidget(day: '$dayNumber');
            } else if (youDid > 0) {
              return CalendarPartDoneWidget(day: '$dayNumber');
            } else {
              return CalendarNotDoneWidget(day: '$dayNumber');
            }
          }
        },
      ),
    );
  }

  int _extraItemCount(DateTime firstDayOfMonth) {
    final DateFormat formatter = DateFormat('EEEE');

    final day = formatter.format(firstDayOfMonth);

    switch (day) {
      case 'Sunday':
        return 0;
      case 'Monday':
        return 1;
      case 'Tuesday':
        return 2;
      case 'Wednesday':
        return 3;
      case 'Thursday':
        return 4;
      case 'Friday':
        return 5;
      case 'Saturday':
        return 6;
      default:
        return 0;
    }
  }
}
