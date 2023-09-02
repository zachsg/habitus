// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeModel _$$_HomeModelFromJson(Map<String, dynamic> json) => _$_HomeModel(
      teams: (json['teams'] as List<dynamic>)
          .map((e) => HUTeamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$_HomeModelToJson(_$_HomeModel instance) =>
    <String, dynamic>{
      'teams': instance.teams,
      'loading': instance.loading,
      'error': instance.error,
    };
