import 'package:freezed_annotation/freezed_annotation.dart';

import 'day.dart';
import 'xmodels.dart';

part 'h_u_goal_model.freezed.dart';
part 'h_u_goal_model.g.dart';

@freezed
class HUGoalModel with _$HUGoalModel {
  factory HUGoalModel({
    @JsonKey(name: 'habitat_id') required int habitatId,
    required String habit,
    required Unit unit,
    required int value,
  }) = _HUGoalModel;

  factory HUGoalModel.fromJson(Map<String, Object?> json) =>
      _$HUGoalModelFromJson(json);
}
