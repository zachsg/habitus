// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaderboardModelImpl _$$LeaderboardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaderboardModelImpl(
      habitat: HUHabitatModel.fromJson(json['habitat'] as Map<String, dynamic>),
      habitats: (json['habitats'] as List<dynamic>?)
              ?.map((e) => HUHabitatModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      profiles: (json['profiles'] as List<dynamic>?)
              ?.map((e) => HUProfileModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      credits: (json['credits'] as List<dynamic>?)
              ?.map((e) => HUCreditModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$LeaderboardModelImplToJson(
        _$LeaderboardModelImpl instance) =>
    <String, dynamic>{
      'habitat': instance.habitat,
      'habitats': instance.habitats,
      'profiles': instance.profiles,
      'credits': instance.credits,
      'loading': instance.loading,
      'error': instance.error,
    };
