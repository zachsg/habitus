// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habitats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitatsModelImpl _$$HabitatsModelImplFromJson(Map<String, dynamic> json) =>
    _$HabitatsModelImpl(
      habitats: (json['habitats'] as List<dynamic>)
          .map((e) => HUHabitatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      actions: (json['actions'] as List<dynamic>)
          .map((e) => HUActionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pastWeekActions: (json['pastWeekActions'] as List<dynamic>)
          .map((e) => HUActionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      callouts: (json['callouts'] as List<dynamic>)
          .map((e) => HUCalloutModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$HabitatsModelImplToJson(_$HabitatsModelImpl instance) =>
    <String, dynamic>{
      'habitats': instance.habitats,
      'actions': instance.actions,
      'pastWeekActions': instance.pastWeekActions,
      'callouts': instance.callouts,
      'loading': instance.loading,
      'error': instance.error,
    };
