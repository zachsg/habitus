// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_u_team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HUTeamModel _$$_HUTeamModelFromJson(Map<String, dynamic> json) =>
    _$_HUTeamModel(
      id: json['id'] as int,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      creatorId: json['creator_id'] as String,
      name: json['name'] as String? ?? '',
      header: json['header'] as String? ?? '',
      habit: json['habit'] as String,
      unit: $enumDecode(_$UnitEnumMap, json['unit']),
      value: json['value'] as int,
      admins: (json['admins'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      actions: (json['actions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isOpen: json['is_open'] as bool? ?? true,
    );

Map<String, dynamic> _$$_HUTeamModelToJson(_$_HUTeamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'updated_at': instance.updatedAt.toIso8601String(),
      'creator_id': instance.creatorId,
      'name': instance.name,
      'header': instance.header,
      'habit': instance.habit,
      'unit': _$UnitEnumMap[instance.unit]!,
      'value': instance.value,
      'admins': instance.admins,
      'members': instance.members,
      'actions': instance.actions,
      'is_open': instance.isOpen,
    };

const _$UnitEnumMap = {
  Unit.distance: 'distance',
  Unit.steps: 'steps',
  Unit.time: 'time',
};
