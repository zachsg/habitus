import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/xmodels.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
class SettingsModel with _$SettingsModel {
  factory SettingsModel({
    required HUProfileModel profile,
    @Default(false) bool minimalTimer,
    @Default(false) bool loading,
    String? error,
  }) = _SettingsModel;

  factory SettingsModel.fromJson(Map<String, Object?> json) =>
      _$SettingsModelFromJson(json);
}
