import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/xmodels.dart';

part 'grow_model.freezed.dart';
part 'grow_model.g.dart';

@freezed
class GrowModel with _$GrowModel {
  factory GrowModel({
    required HUHabitatModel habitat,
    @Default(false) bool loading,
    @Default(0) int elapsed,
    @Default(false) bool isPaused,
    String? error,
  }) = _GrowModel;

  factory GrowModel.fromJson(Map<String, Object?> json) =>
      _$GrowModelFromJson(json);
}
