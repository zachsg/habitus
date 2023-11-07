import 'package:freezed_annotation/freezed_annotation.dart';

import 'habit_type.dart';
import 'xmodels.dart';

part 'h_u_habitat_model.freezed.dart';
part 'h_u_habitat_model.g.dart';

@freezed
class HUHabitatModel with _$HUHabitatModel {
  factory HUHabitatModel({
    required int id,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'creator_id') required String creatorId,
    @Default('') String name,
    @Default('') String header,
    required HabitType type,
    @Default(Unit.minutes) Unit unit,
    @JsonKey(name: "team_goal") @Default(0) int teamGoal,
    @JsonKey(name: 'team_goal_last_met') required DateTime teamGoalLastMet,
    @Default([]) List<String> admins,
    @Default([]) List<String> members,
    @JsonKey(name: 'is_open') @Default(true) bool isOpen,
    @Default(10) int cap,
  }) = _HUHabitatModel;

  factory HUHabitatModel.fromJson(Map<String, Object?> json) =>
      _$HUHabitatModelFromJson(json);
}
