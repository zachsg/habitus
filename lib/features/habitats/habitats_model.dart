import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/xmodels.dart';

part 'habitats_model.freezed.dart';
part 'habitats_model.g.dart';

@freezed
class HabitatsModel with _$HabitatsModel {
  factory HabitatsModel({
    required List<HUHabitatModel> habitats,
    @Default(false) bool loading,
    String? error,
  }) = _HabitatsModel;

  factory HabitatsModel.fromJson(Map<String, Object?> json) =>
      _$HabitatsModelFromJson(json);
}
