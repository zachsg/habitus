import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobn/helpers/extensions.dart';

import '../../models/completion.dart';
import '../../models/xmodels.dart';
import '../habitats/widgets/xwidgets.dart';
import '../profile/profile.dart';
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

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(calendarProvider(widget.habitats));
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12.0),
          CalendarHabitatPickerWidget(habitats: widget.habitats),
          provider.actions.isNotEmpty
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: ref
                                .read(
                                    calendarProvider(widget.habitats).notifier)
                                .prevMonth,
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                          const SizedBox(width: 12.0),
                          Text(provider.date.month.toMonthLong()),
                          const SizedBox(width: 12.0),
                          IconButton(
                            onPressed: ref
                                .read(
                                    calendarProvider(widget.habitats).notifier)
                                .nextMonth,
                            icon: const Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                          crossAxisCount: 7,
                          // childAspectRatio: 0.85,
                        ),
                        itemCount: lastDayOfMonth.day +
                            _extraItemCount(firstDayOfMonth),
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
                    ),
                  ],
                )
              : const CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }
}
