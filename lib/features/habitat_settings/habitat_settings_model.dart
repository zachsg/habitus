import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/xmodels.dart';

part 'habitat_settings_model.freezed.dart';
part 'habitat_settings_model.g.dart';

@freezed
class HabitatSettingsModel with _$HabitatSettingsModel {
  factory HabitatSettingsModel({
    required HUHabitatModel habitat,
    required HUProfileModel profile,
    @Default('') String search,
    @Default([]) List<HUProfileModel> possibleInvites,
    @Default(false) bool loading,
    String? error,
  }) = _HabitatSettingsModel;

  factory HabitatSettingsModel.fromJson(Map<String, Object?> json) =>
      _$HabitatSettingsModelFromJson(json);
}
