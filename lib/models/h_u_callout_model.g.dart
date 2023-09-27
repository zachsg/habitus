// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_u_callout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HUCalloutModelImpl _$$HUCalloutModelImplFromJson(Map<String, dynamic> json) =>
    _$HUCalloutModelImpl(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      habitatId: json['habitat_id'] as int,
      caller: json['caller'] as String,
      callee: json['callee'] as String,
      done: json['done'] as bool? ?? false,
    );

Map<String, dynamic> _$$HUCalloutModelImplToJson(
        _$HUCalloutModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'habitat_id': instance.habitatId,
      'caller': instance.caller,
      'callee': instance.callee,
      'done': instance.done,
    };
