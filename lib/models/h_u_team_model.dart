import 'package:freezed_annotation/freezed_annotation.dart';

import 'xmodels.dart';

part 'h_u_team_model.freezed.dart';
part 'h_u_team_model.g.dart';

@freezed
class HUTeamModel with _$HUTeamModel {
  factory HUTeamModel({
    required int id,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'creator_id') required String creatorId,
    @Default('') String name,
    @Default('') String header,
    required String habit,
    required Unit unit,
    required int value,
    @Default([]) List<String> admins,
    @Default([]) List<String> members,
    @Default([]) List<String> actions,
    @JsonKey(name: 'is_open') @Default(true) bool isOpen,
  }) = _HUTeamModel;

  factory HUTeamModel.fromJson(Map<String, Object?> json) =>
      _$HUTeamModelFromJson(json);
}
