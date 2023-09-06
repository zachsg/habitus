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
      ...state.habitat.members,
      ...state.habitat.admins,
      state.habitat.creatorId,
    ];

    final profiles = await Database.profilesWithIds(ids);

    state = state.copyWith(profiles: profiles, loading: false);
  }

  Future<void> loadActions() async {
    final actions = await Database.actionsWithHabitatId(state.habitat.id);

    state = state.copyWith(actions: actions, loading: false);
  }
}
