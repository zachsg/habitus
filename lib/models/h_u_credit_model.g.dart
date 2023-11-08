// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_u_credit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HUCreditModelImpl _$$HUCreditModelImplFromJson(Map<String, dynamic> json) =>
    _$HUCreditModelImpl(
      id: json['id'] as int? ?? -1,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      ownerId: json['owner_id'] as String,
      habitatId: json['habitat_id'] as int,
      year: json['year'] as int,
      weekNumber: json['week_number'] as int,
      credits: json['credits'] as int? ?? 0,
      accomplished: json['accomplished'] as int? ?? 0,
    );

Map<String, dynamic> _$$HUCreditModelImplToJson(_$HUCreditModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'updated_at': instance.updatedAt.toIso8601String(),
      'owner_id': instance.ownerId,
      'habitat_id': instance.habitatId,
      'year': instance.year,
      'week_number': instance.weekNumber,
      'credits': instance.credits,
      'accomplished': instance.accomplished,
    };
