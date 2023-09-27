// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_u_action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HUActionModelImpl _$$HUActionModelImplFromJson(Map<String, dynamic> json) =>
    _$HUActionModelImpl(
      id: json['id'] as int,
      habitatId: json['habitat_id'] as int,
      ownerId: json['owner_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      reactions: (json['reactions'] as List<dynamic>?)
              ?.map((e) => HUReactionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      goal: HUGoalModel.fromJson(json['goal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HUActionModelImplToJson(_$HUActionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'habitat_id': instance.habitatId,
      'owner_id': instance.ownerId,
      'created_at': instance.createdAt.toIso8601String(),
      'reactions': instance.reactions,
      'goal': instance.goal,
    };
