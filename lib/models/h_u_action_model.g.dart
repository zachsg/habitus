// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_u_action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HUActionModel _$$_HUActionModelFromJson(Map<String, dynamic> json) =>
    _$_HUActionModel(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      ownerId: json['owner_id'] as String,
      name: json['name'] as String,
      unit: $enumDecode(_$UnitEnumMap, json['unit']),
      value: json['value'] as int,
    );

Map<String, dynamic> _$$_HUActionModelToJson(_$_HUActionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'owner_id': instance.ownerId,
      'name': instance.name,
      'unit': _$UnitEnumMap[instance.unit]!,
      'value': instance.value,
    };

const _$UnitEnumMap = {
  Unit.distance: 'distance',
  Unit.steps: 'steps',
  Unit.time: 'time',
};
