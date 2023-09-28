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
      final actions = await Database.myActionsForToday();
      state = state.copyWith(actions: actions, loading: false);
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
