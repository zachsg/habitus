// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_habitat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JoinHabitatModel _$$_JoinHabitatModelFromJson(Map<String, dynamic> json) =>
    _$_JoinHabitatModel(
      habitat: HUHabitatModel.fromJson(json['habitat'] as Map<String, dynamic>),
      habitats: (json['habitats'] as List<dynamic>)
          .map((e) => HUHabitatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$_JoinHabitatModelToJson(_$_JoinHabitatModel instance) =>
    <String, dynamic>{
      'habitat': instance.habitat,
      'habitats': instance.habitats,
      'loading': instance.loading,
      'error': instance.error,
    };
