import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/xmodels.dart';
import '../../services/database.dart';
import '../profile/profile.dart';
import 'habitat_model.dart';

part 'habitat.g.dart';

@riverpod
class Habitat extends _$Habitat {
  @override
  HabitatModel build(HUHabitatModel habitat) {
    return HabitatModel(
      habitat: habitat,
      day: DateTime.now(),
      loading: true,
    );
  }

  Future<void> loadProfiles() async {
    final ids = [
      state.habitat.creatorId,
      ...state.habitat.admins,
      ...state.habitat.members,
    ];

    final profiles = await Database.profilesWithIds(ids);

    profiles.sort((a, b) {
      if (a.id == state.habitat.creatorId) {
        return 0;
      }

      if (b.id == state.habitat.creatorId) {
        return 1;
      }

      if (state.habitat.admins.contains(a.id)) {
        return 0;
      }

      if (state.habitat.admins.contains(b.id)) {
        return 1;
      }

      return 0;
    });

    state = state.copyWith(profiles: profiles);
  }

  Future<void> loadActions() async {
    final actions = await Database.actionsWithHabitatId(
      state.habitat.id,
      state.day,
    );

    state = state.copyWith(actions: actions);
  }

  Future<void> loadCallouts() async {
    final callouts = await Database.calloutsWithHabitatId(
      id: state.habitat.id,
      isDone: false,
    );

    state = state.copyWith(callouts: callouts);
  }

  void setLoading(bool loading) {
    state = state.copyWith(loading: loading);
  }

  void setHabitatPercentage(int percentage) {
    state = state.copyWith(percentage: percentage);
  }

  Future<void> loadHabitatWithId(int id) async {
    final habitat = await Database.habitatWithId(id);
    state = state.copyWith(habitat: habitat, loading: false);
  }

  Future<void> nextDay() async {
    final day = state.day.add(const Duration(days: 1));
    state = state.copyWith(day: day, callouts: []);

    await loadActions();
  }

  Future<void> previousDay() async {
    final day = state.day.subtract(const Duration(days: 1));
    state = state.copyWith(day: day, callouts: []);

    await loadActions();
  }

  Future<void> resetDay() async {
    final day = DateTime.now();
    state = state.copyWith(day: day);

    await loadActions();
    await loadCallouts();
  }

  void setCustomReactionText(String text) =>
      state = state.copyWith(customReactionText: text);
}
