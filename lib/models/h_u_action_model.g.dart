// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_u_action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HUActionModel _$$_HUActionModelFromJson(Map<String, dynamic> json) =>
    _$_HUActionModel(
      id: json['id'] as int,
      habitatId: json['habitat_id'] as int,
      ownerId: json['owner_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      goal: HUGoalModel.fromJson(json['goal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HUActionModelToJson(_$_HUActionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'habitat_id': instance.habitatId,
      'owner_id': instance.ownerId,
      'created_at': instance.createdAt.toIso8601String(),
      'goal': instance.goal,
    };
