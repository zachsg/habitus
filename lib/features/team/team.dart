import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/xmodels.dart';
import 'team_model.dart';

part 'team.g.dart';

@riverpod
class Team extends _$Team {
  @override
  TeamModel build() => TeamModel(
        team: HUTeamModel(
          id: -1,
          updatedAt: DateTime.now(),
          creatorId: '',
          goal: HUGoalModel(habit: '', unit: Unit.minutes, value: 0),
        ),
        loading: true,
      );
}
