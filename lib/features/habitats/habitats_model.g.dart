// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habitats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HabitatsModel _$$_HabitatsModelFromJson(Map<String, dynamic> json) =>
    _$_HabitatsModel(
      habitats: (json['habitats'] as List<dynamic>)
          .map((e) => HUHabitatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      actions: (json['actions'] as List<dynamic>)
          .map((e) => HUActionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$_HabitatsModelToJson(_$_HabitatsModel instance) =>
    <String, dynamic>{
      'habitats': instance.habitats,
      'actions': instance.actions,
      'loading': instance.loading,
      'error': instance.error,
    };
