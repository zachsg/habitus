import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/xmodels.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
class TeamModel with _$TeamModel {
  factory TeamModel({
    required HUTeamModel team,
    @Default([]) List<HUProfileModel> profiles,
    @Default([]) List<HUActionModel> actions,
    @Default(false) bool loading,
    String? error,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, Object?> json) =>
      _$TeamModelFromJson(json);
}
