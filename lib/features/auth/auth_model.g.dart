// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthModelImpl _$$AuthModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthModelImpl(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      confirmPassword: json['confirmPassword'] as String? ?? '',
      name: json['name'] as String? ?? '',
      handle: json['handle'] as String? ?? '',
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$AuthModelImplToJson(_$AuthModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'name': instance.name,
      'handle': instance.handle,
      'loading': instance.loading,
      'error': instance.error,
    };
