// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_u_goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HUGoalModelImpl _$$HUGoalModelImplFromJson(Map<String, dynamic> json) =>
    _$HUGoalModelImpl(
      habitatId: json['habitat_id'] as int,
      habit: json['habit'] as String,
      unit: $enumDecode(_$UnitEnumMap, json['unit']),
      value: json['value'] as int,
    );

Map<String, dynamic> _$$HUGoalModelImplToJson(_$HUGoalModelImpl instance) =>
    <String, dynamic>{
      'habitat_id': instance.habitatId,
      'habit': instance.habit,
      'unit': _$UnitEnumMap[instance.unit]!,
      'value': instance.value,
    };

const _$UnitEnumMap = {
  Unit.miles: 'miles',
  Unit.steps: 'steps',
  Unit.minutes: 'minutes',
};
