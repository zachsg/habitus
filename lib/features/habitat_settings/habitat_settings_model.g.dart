// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habitat_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitatSettingsModelImpl _$$HabitatSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HabitatSettingsModelImpl(
      habitat: HUHabitatModel.fromJson(json['habitat'] as Map<String, dynamic>),
      profile: HUProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$HabitatSettingsModelImplToJson(
        _$HabitatSettingsModelImpl instance) =>
    <String, dynamic>{
      'habitat': instance.habitat,
      'profile': instance.profile,
      'loading': instance.loading,
      'error': instance.error,
    };
