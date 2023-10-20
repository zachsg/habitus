// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarModelImpl _$$CalendarModelImplFromJson(Map<String, dynamic> json) =>
    _$CalendarModelImpl(
      habitats: (json['habitats'] as List<dynamic>)
          .map((e) => HUHabitatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      habitat: HUHabitatModel.fromJson(json['habitat'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
      actions: (json['actions'] as List<dynamic>?)
              ?.map((e) => HUActionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$CalendarModelImplToJson(_$CalendarModelImpl instance) =>
    <String, dynamic>{
      'habitats': instance.habitats,
      'habitat': instance.habitat,
      'date': instance.date.toIso8601String(),
      'actions': instance.actions,
      'loading': instance.loading,
      'error': instance.error,
    };
