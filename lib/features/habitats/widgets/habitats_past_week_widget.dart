import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../models/xmodels.dart';
import '../habitats.dart';

class HabitatsPastWeekWidget extends ConsumerWidget {
  const HabitatsPastWeekWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: pastWeekActivity(ref),
    );
  }

  List<Widget> pastWeekActivity(WidgetRef ref) {
    final habitatsP = ref.read(habitatsProvider);
    final allActions = [...habitatsP.actions, ...habitatsP.pastWeekActions];

    final today = DateTime.now().copyWith(hour: 0, minute: 0);
    final DateFormat formatter = DateFormat('EEEE');

    Map<String, bool> daysAndActions = {};
    for (int i = 0; i < 7; i++) {
      final d = today.subtract(Duration(days: i));
      final formattedDate = formatter.format(d);

      bool found = false;
      for (final action in allActions) {
        if (action.createdAt.toLocal().day == d.day &&
            action.habitatId == habitat.id) {
          found = true;
          break;
        }
      }

      daysAndActions.addAll({formattedDate: found});
    }

    final List<Widget> children = [];
    daysAndActions.forEach((key, value) {
      if (value) {
        children.add(HabitatsDoneWidget(day: key[0]));
      } else {
        children.add(HabitatsNotDoneWidget(day: key[0]));
      }
    });

    return children.reversed.toList();
  }
}

class HabitatsNotDoneWidget extends StatelessWidget {
  const HabitatsNotDoneWidget({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
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

class HabitatsPartDoneWidget extends StatelessWidget {
  const HabitatsPartDoneWidget({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 20.0,
          height: 20.0,
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

class HabitatsDoneWidget extends StatelessWidget {
  const HabitatsDoneWidget({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: Colors.yellow.shade800,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 2,
          bottom: 2,
          left: 2,
          right: 2,
          child: Container(
            width: 16.0,
            height: 16.0,
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
        ),
      ],
    );
  }
}
