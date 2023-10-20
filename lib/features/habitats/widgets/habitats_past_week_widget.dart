import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../models/completion.dart';
import '../../../models/xmodels.dart';
import '../../profile/profile.dart';
import '../habitats.dart';
import 'xwidgets.dart';

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
    final profile = ref.read(profileProvider).profile;
    final goal = profile.goals.firstWhere(
      (goal) => goal.habitatId == habitat.id,
      orElse: () =>
          HUGoalModel(habitatId: -1, habit: '', unit: Unit.minutes, value: 0),
    );

    final habitatsP = ref.read(habitatsProvider);
    final allActions = [...habitatsP.actions, ...habitatsP.pastWeekActions];

    final today = DateTime.now().copyWith(hour: 0, minute: 0);
    final DateFormat formatter = DateFormat('EEEE');

    Map<String, Completion> daysAndActions = {};
    for (int i = 0; i < 7; i++) {
      final d = today.subtract(Duration(days: i));
      final formattedDate = formatter.format(d);

      Completion completion = Completion.undone;
      int youDid = 0;
      for (final action in allActions) {
        if (action.createdAt.toLocal().day == d.day &&
            action.habitatId == habitat.id) {
          youDid += action.goal.value;
        }
      }

      if (youDid >= goal.value) {
        completion = Completion.done;
      } else if (youDid > 0) {
        completion = Completion.sorta;
      }

      daysAndActions.addAll({formattedDate: completion});
    }

    final List<Widget> children = [];
    daysAndActions.forEach((key, value) {
      if (value == Completion.done) {
        children.add(HabitatsDoneWidget(day: key[0]));
      } else if (value == Completion.sorta) {
        children.add(HabitatsPartDoneWidget(day: key[0]));
      } else {
        children.add(HabitatsNotDoneWidget(day: key[0]));
      }
    });

    return children.reversed.toList();
  }
}
