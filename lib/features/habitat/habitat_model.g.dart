// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habitat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitatModelImpl _$$HabitatModelImplFromJson(Map<String, dynamic> json) =>
    _$HabitatModelImpl(
      habitat: HUHabitatModel.fromJson(json['habitat'] as Map<String, dynamic>),
      day: DateTime.parse(json['day'] as String),
      profiles: (json['profiles'] as List<dynamic>?)
              ?.map((e) => HUProfileModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      actions: (json['actions'] as List<dynamic>?)
              ?.map((e) => HUActionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      percentage: json['percentage'] as int? ?? 0,
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$HabitatModelImplToJson(_$HabitatModelImpl instance) =>
    <String, dynamic>{
      'habitat': instance.habitat,
      'day': instance.day.toIso8601String(),
      'profiles': instance.profiles,
      'actions': instance.actions,
      'percentage': instance.percentage,
      'loading': instance.loading,
      'error': instance.error,
    };
