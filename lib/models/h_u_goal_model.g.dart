// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_u_goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HUGoalModel _$$_HUGoalModelFromJson(Map<String, dynamic> json) =>
    _$_HUGoalModel(
      habit: json['habit'] as String,
      unit: $enumDecode(_$UnitEnumMap, json['unit']),
      value: json['value'] as int,
    );

Map<String, dynamic> _$$_HUGoalModelToJson(_$_HUGoalModel instance) =>
    <String, dynamic>{
      'habit': instance.habit,
      'unit': _$UnitEnumMap[instance.unit]!,
      'value': instance.value,
    };

const _$UnitEnumMap = {
  Unit.distance: 'distance',
  Unit.steps: 'steps',
  Unit.time: 'time',
};
