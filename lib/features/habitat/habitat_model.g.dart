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
      callouts: (json['callouts'] as List<dynamic>?)
              ?.map((e) => HUCalloutModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      credits: (json['credits'] as List<dynamic>?)
              ?.map((e) => HUCreditModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      customReactionText: json['customReactionText'] as String? ?? '',
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
      'callouts': instance.callouts,
      'credits': instance.credits,
      'customReactionText': instance.customReactionText,
      'percentage': instance.percentage,
      'loading': instance.loading,
      'error': instance.error,
    };
