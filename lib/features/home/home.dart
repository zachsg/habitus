import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/database.dart';
import 'home_model.dart';

part 'home.g.dart';

@Riverpod(keepAlive: true)
class Home extends _$Home {
  @override
  HomeModel build() => HomeModel(teams: [], loading: true);

  Future<void> loadTeams() async {
    // state = state.copyWith(loading: true);
    try {
      final teams = await Database.teams();
      state = state.copyWith(teams: teams, loading: false);
    } on Exception catch (_) {
      state = state.copyWith(error: 'An error occurred', loading: false);
    }
  }
}
