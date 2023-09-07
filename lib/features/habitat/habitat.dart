import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/xmodels.dart';
import '../../services/database.dart';
import 'habitat_model.dart';

part 'habitat.g.dart';

@riverpod
class Habitat extends _$Habitat {
  @override
  HabitatModel build(HUHabitatModel habitat) => HabitatModel(
        habitat: habitat,
        loading: true,
      );

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

    state = state.copyWith(profiles: profiles, loading: false);
  }

  Future<void> loadActions() async {
    final actions = await Database.actionsWithHabitatId(state.habitat.id);

    state = state.copyWith(actions: actions, loading: false);
  }

  void setHabitatPercentage(int percentage) {
    state = state.copyWith(percentage: percentage);
  }
}
