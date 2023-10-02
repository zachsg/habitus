// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habitat_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitatSettingsModelImpl _$$HabitatSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HabitatSettingsModelImpl(
      profile: HUProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      habitat: HUHabitatModel.fromJson(json['habitat'] as Map<String, dynamic>),
      dailyGoal: json['daily_goal'] as int? ?? 10,
      memberCap: json['member_cap'] as int? ?? 10,
      isPrivate: json['is_private'] as bool? ?? false,
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$HabitatSettingsModelImplToJson(
        _$HabitatSettingsModelImpl instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'habitat': instance.habitat,
      'daily_goal': instance.dailyGoal,
      'member_cap': instance.memberCap,
      'is_private': instance.isPrivate,
      'loading': instance.loading,
      'error': instance.error,
    };
