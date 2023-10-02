import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/xmodels.dart';

part 'habitat_settings_model.freezed.dart';
part 'habitat_settings_model.g.dart';

@freezed
class HabitatSettingsModel with _$HabitatSettingsModel {
  factory HabitatSettingsModel({
    required HUProfileModel profile,
    required HUHabitatModel habitat,
    @JsonKey(name: 'daily_goal') @Default(10) int dailyGoal,
    @JsonKey(name: 'member_cap') @Default(10) int memberCap,
    @JsonKey(name: 'is_private') @Default(false) bool isPrivate,
    @Default(false) bool loading,
    String? error,
  }) = _HabitatSettingsModel;

  factory HabitatSettingsModel.fromJson(Map<String, Object?> json) =>
      _$HabitatSettingsModelFromJson(json);
}
