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
      maxElapsed: json['maxElapsed'] as int? ?? 0,
      goalMet: json['goalMet'] as bool? ?? false,
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
      'maxElapsed': instance.maxElapsed,
      'goalMet': instance.goalMet,
      'isPaused': instance.isPaused,
      'calloutId': instance.calloutId,
      'error': instance.error,
    };
