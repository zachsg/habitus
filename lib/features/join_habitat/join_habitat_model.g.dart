// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_habitat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JoinHabitatModelImpl _$$JoinHabitatModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JoinHabitatModelImpl(
      habitat: HUHabitatModel.fromJson(json['habitat'] as Map<String, dynamic>),
      habitats: (json['habitats'] as List<dynamic>)
          .map((e) => HUHabitatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$JoinHabitatModelImplToJson(
        _$JoinHabitatModelImpl instance) =>
    <String, dynamic>{
      'habitat': instance.habitat,
      'habitats': instance.habitats,
      'loading': instance.loading,
      'error': instance.error,
    };
