// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habitat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HabitatModel _$$_HabitatModelFromJson(Map<String, dynamic> json) =>
    _$_HabitatModel(
      habitat: HUHabitatModel.fromJson(json['habitat'] as Map<String, dynamic>),
      profiles: (json['profiles'] as List<dynamic>?)
              ?.map((e) => HUProfileModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      actions: (json['actions'] as List<dynamic>?)
              ?.map((e) => HUActionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$_HabitatModelToJson(_$_HabitatModel instance) =>
    <String, dynamic>{
      'habitat': instance.habitat,
      'profiles': instance.profiles,
      'actions': instance.actions,
      'loading': instance.loading,
      'error': instance.error,
    };
