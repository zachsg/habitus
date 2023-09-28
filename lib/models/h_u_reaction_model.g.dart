// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_u_reaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HUReactionModelImpl _$$HUReactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HUReactionModelImpl(
      id: json['id'] as int,
      actionId: json['action_id'] as int? ?? 0,
      calloutId: json['callout_id'] as int? ?? 0,
      ownerId: json['owner_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      icon: json['icon'] as String? ?? '',
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$$HUReactionModelImplToJson(
        _$HUReactionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action_id': instance.actionId,
      'callout_id': instance.calloutId,
      'owner_id': instance.ownerId,
      'created_at': instance.createdAt.toIso8601String(),
      'icon': instance.icon,
      'text': instance.text,
    };
