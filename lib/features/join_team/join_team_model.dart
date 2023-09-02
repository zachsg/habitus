import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/xmodels.dart';

part 'join_team_model.freezed.dart';
part 'join_team_model.g.dart';

@freezed
class JoinTeamModel with _$JoinTeamModel {
  factory JoinTeamModel({
    required HUTeamModel team,
    required List<HUTeamModel> teams,
    @Default(false) bool loading,
    String? error,
  }) = _JoinTeamModel;

  factory JoinTeamModel.fromJson(Map<String, Object?> json) =>
      _$JoinTeamModelFromJson(json);
}
