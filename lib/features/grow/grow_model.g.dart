// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GrowModelImpl _$$GrowModelImplFromJson(Map<String, dynamic> json) =>
    _$GrowModelImpl(
      habitat: HUHabitatModel.fromJson(json['habitat'] as Map<String, dynamic>),
      loading: json['loading'] as bool? ?? false,
      elapsed: json['elapsed'] as int? ?? 0,
      alreadyElapsed: json['alreadyElapsed'] as int? ?? 0,
      isPaused: json['isPaused'] as bool? ?? false,
      calloutId: json['calloutId'] as String? ?? '',
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$GrowModelImplToJson(_$GrowModelImpl instance) =>
    <String, dynamic>{
      'habitat': instance.habitat,
      'loading': instance.loading,
      'elapsed': instance.elapsed,
      'alreadyElapsed': instance.alreadyElapsed,
      'isPaused': instance.isPaused,
      'calloutId': instance.calloutId,
      'error': instance.error,
    };
