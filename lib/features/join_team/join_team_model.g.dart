// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JoinTeamModel _$$_JoinTeamModelFromJson(Map<String, dynamic> json) =>
    _$_JoinTeamModel(
      team: HUTeamModel.fromJson(json['team'] as Map<String, dynamic>),
      teams: (json['teams'] as List<dynamic>)
          .map((e) => HUTeamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$_JoinTeamModelToJson(_$_JoinTeamModel instance) =>
    <String, dynamic>{
      'team': instance.team,
      'teams': instance.teams,
      'loading': instance.loading,
      'error': instance.error,
    };
