// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GrowModel _$$_GrowModelFromJson(Map<String, dynamic> json) => _$_GrowModel(
      habitat: HUHabitatModel.fromJson(json['habitat'] as Map<String, dynamic>),
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$_GrowModelToJson(_$_GrowModel instance) =>
    <String, dynamic>{
      'habitat': instance.habitat,
      'loading': instance.loading,
      'error': instance.error,
    };
