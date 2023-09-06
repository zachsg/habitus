// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_u_habitat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HUHabitatModel _$$_HUHabitatModelFromJson(Map<String, dynamic> json) =>
    _$_HUHabitatModel(
      id: json['id'] as int,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      creatorId: json['creator_id'] as String,
      name: json['name'] as String? ?? '',
      header: json['header'] as String? ?? '',
      goal: HUGoalModel.fromJson(json['goal'] as Map<String, dynamic>),
      admins: (json['admins'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isOpen: json['is_open'] as bool? ?? true,
    );

Map<String, dynamic> _$$_HUHabitatModelToJson(_$_HUHabitatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'updated_at': instance.updatedAt.toIso8601String(),
      'creator_id': instance.creatorId,
      'name': instance.name,
      'header': instance.header,
      'goal': instance.goal,
      'admins': instance.admins,
      'members': instance.members,
      'is_open': instance.isOpen,
    };
