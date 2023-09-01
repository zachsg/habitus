// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_u_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HUProfileModel _$$_HUProfileModelFromJson(Map<String, dynamic> json) =>
    _$_HUProfileModel(
      id: json['id'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      handle: json['handle'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      badges:
          (json['badges'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      teams:
          (json['teams'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      friends: (json['friends'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isPro: json['is_pro'] as bool? ?? false,
    );

Map<String, dynamic> _$$_HUProfileModelToJson(_$_HUProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'updated_at': instance.updatedAt.toIso8601String(),
      'name': instance.name,
      'email': instance.email,
      'handle': instance.handle,
      'bio': instance.bio,
      'avatar': instance.avatar,
      'badges': instance.badges,
      'teams': instance.teams,
      'friends': instance.friends,
      'is_pro': instance.isPro,
    };
