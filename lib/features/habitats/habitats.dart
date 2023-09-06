import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/database.dart';
import 'habitats_model.dart';

part 'habitats.g.dart';

@Riverpod(keepAlive: true)
class Habitats extends _$Habitats {
  @override
  HabitatsModel build() => HabitatsModel(habitats: [], loading: true);

  Future<void> loadHabitats() async {
    // state = state.copyWith(loading: true);
    try {
      final habitats = await Database.habitats();
      state = state.copyWith(habitats: habitats, loading: false);
    } on Exception catch (_) {
      state = state.copyWith(error: 'An error occurred', loading: false);
    }
  }
}
