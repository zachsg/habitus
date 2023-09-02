import 'package:freezed_annotation/freezed_annotation.dart';

import 'xmodels.dart';

part 'h_u_action_model.freezed.dart';
part 'h_u_action_model.g.dart';

@freezed
class HUActionModel with _$HUActionModel {
  factory HUActionModel({
    required int id,
    @JsonKey(name: 'team_id') required int teamId,
    @JsonKey(name: 'owner_id') required String ownerId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required HUGoalModel goal,
  }) = _HUActionModel;

  factory HUActionModel.fromJson(Map<String, Object?> json) =>
      _$HUActionModelFromJson(json);
}
