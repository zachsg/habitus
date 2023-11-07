import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/animal.dart';
import '../../models/habit_type.dart';
import '../../models/xmodels.dart';

part 'join_habitat_model.freezed.dart';
part 'join_habitat_model.g.dart';

@freezed
class JoinHabitatModel with _$JoinHabitatModel {
  factory JoinHabitatModel({
    required List<HUHabitatModel> habitats,
    @Default(Animal.quails) Animal animal,
    @Default(HabitType.read) HabitType type,
    @Default(Unit.minutes) Unit unit,
    @Default(10) int goal,
    @Default(4) int cap,
    @JsonKey(name: 'is_open') @Default(true) bool isOpen,
    @JsonKey(name: 'is_joining') @Default(true) bool isJoining,
    @Default(false) bool loading,
    String? error,
  }) = _JoinHabitatModel;

  factory JoinHabitatModel.fromJson(Map<String, Object?> json) =>
      _$JoinHabitatModelFromJson(json);
}
