import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/xmodels.dart';
import '../../services/database.dart';
import 'team_model.dart';

part 'team.g.dart';

@riverpod
class Team extends _$Team {
  @override
  TeamModel build(HUTeamModel team) => TeamModel(
        team: team,
        loading: true,
      );

  Future<void> loadProfiles() async {
    final ids = [
      ...state.team.members,
      ...state.team.admins,
      state.team.creatorId,
    ];

    final profiles = await Database.profilesWithIds(ids);

    state = state.copyWith(profiles: profiles, loading: false);
  }

  Future<void> loadActions() async {
    final actions = await Database.actionsWithTeamId(state.team.id);

    state = state.copyWith(actions: actions, loading: false);
  }
}
