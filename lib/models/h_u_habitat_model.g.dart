// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_u_habitat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HUHabitatModelImpl _$$HUHabitatModelImplFromJson(Map<String, dynamic> json) =>
    _$HUHabitatModelImpl(
      id: json['id'] as int,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      creatorId: json['creator_id'] as String,
      name: json['name'] as String? ?? '',
      header: json['header'] as String? ?? '',
      type: $enumDecode(_$HabitTypeEnumMap, json['type']),
      unit: $enumDecodeNullable(_$UnitEnumMap, json['unit']) ?? Unit.minutes,
      teamGoal: json['team_goal'] as int? ?? 0,
      teamGoalLastMet: DateTime.parse(json['team_goal_last_met'] as String),
      admins: (json['admins'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isOpen: json['is_open'] as bool? ?? true,
      cap: json['cap'] as int? ?? 10,
    );

Map<String, dynamic> _$$HUHabitatModelImplToJson(
        _$HUHabitatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'updated_at': instance.updatedAt.toIso8601String(),
      'creator_id': instance.creatorId,
      'name': instance.name,
      'header': instance.header,
      'type': _$HabitTypeEnumMap[instance.type]!,
      'unit': _$UnitEnumMap[instance.unit]!,
      'team_goal': instance.teamGoal,
      'team_goal_last_met': instance.teamGoalLastMet.toIso8601String(),
      'admins': instance.admins,
      'members': instance.members,
      'is_open': instance.isOpen,
      'cap': instance.cap,
    };

const _$HabitTypeEnumMap = {
  HabitType.cook: 'cook',
  HabitType.exercise: 'exercise',
  HabitType.meditate: 'meditate',
  HabitType.read: 'read',
  HabitType.work: 'work',
};

const _$UnitEnumMap = {
  Unit.miles: 'miles',
  Unit.steps: 'steps',
  Unit.minutes: 'minutes',
};
