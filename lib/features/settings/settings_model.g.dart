// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsModelImpl _$$SettingsModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingsModelImpl(
      profile: HUProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      minimalTimer: json['minimalTimer'] as bool? ?? false,
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$SettingsModelImplToJson(_$SettingsModelImpl instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'minimalTimer': instance.minimalTimer,
      'loading': instance.loading,
      'error': instance.error,
    };
