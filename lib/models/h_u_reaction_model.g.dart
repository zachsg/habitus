// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_u_reaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HUReactionModel _$$_HUReactionModelFromJson(Map<String, dynamic> json) =>
    _$_HUReactionModel(
      id: json['id'] as int,
      actionId: json['action_id'] as int,
      ownerId: json['owner_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      icon: json['icon'] as String? ?? '',
      text: json['text'] as String? ?? '',
      goal: HUGoalModel.fromJson(json['goal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HUReactionModelToJson(_$_HUReactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action_id': instance.actionId,
      'owner_id': instance.ownerId,
      'created_at': instance.createdAt.toIso8601String(),
      'icon': instance.icon,
      'text': instance.text,
      'goal': instance.goal,
    };
