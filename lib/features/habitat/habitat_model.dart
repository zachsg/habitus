import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/xmodels.dart';

part 'habitat_model.freezed.dart';
part 'habitat_model.g.dart';

@freezed
class HabitatModel with _$HabitatModel {
  factory HabitatModel({
    required HUHabitatModel habitat,
    required DateTime day,
    @Default([]) List<HUProfileModel> profiles,
    @Default([]) List<HUActionModel> actions,
    @Default([]) List<HUCalloutModel> callouts,
    @Default('') String customReactionText,
    @Default(0) int percentage,
    @Default(false) bool loading,
    String? error,
  }) = _HabitatModel;

  factory HabitatModel.fromJson(Map<String, Object?> json) =>
      _$HabitatModelFromJson(json);
}
