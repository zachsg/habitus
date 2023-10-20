import 'package:mobn/models/xmodels.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/database.dart';
import 'habitats_model.dart';

part 'habitats.g.dart';

@Riverpod(keepAlive: true)
class Habitats extends _$Habitats {
  @override
  HabitatsModel build() => HabitatsModel(
        habitats: [],
        actions: [],
        pastWeekActions: [],
        callouts: [],
        loading: true,
      );

  Future<void> loadHabitats() async {
    try {
      final habitats = await Database.habitats();
      state = state.copyWith(habitats: habitats, loading: false);
    } on Exception catch (_) {
      state = state.copyWith(error: 'An error occurred', loading: false);
    }
  }

  Future<void> loadActions() async {
    try {
      final allActions = await Database.myActionsForPastXDays(7);

      List<HUActionModel> todayActions = [];
      List<HUActionModel> pastActions = [];

      final todayStart = DateTime.now().copyWith(hour: 0, minute: 0);

      for (final action in allActions) {
        if (action.createdAt.isAfter(todayStart)) {
          todayActions.add(action);
        } else {
          pastActions.add(action);
        }
      }

      state = state.copyWith(
        actions: todayActions,
        pastWeekActions: pastActions,
      );
    } on Exception catch (_) {
      state = state.copyWith(error: 'An error occurred', loading: false);
    }
  }

  Future<void> loadCallouts() async {
    try {
      final callouts = await Database.allOfMyCalloutsToday();
      state = state.copyWith(callouts: callouts, loading: false);
    } on Exception catch (_) {
      state = state.copyWith(error: 'An error occurred', loading: false);
    }
  }
}
