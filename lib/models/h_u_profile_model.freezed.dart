// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'h_u_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HUProfileModel _$HUProfileModelFromJson(Map<String, dynamic> json) {
  return _HUProfileModel.fromJson(json);
}

/// @nodoc
mixin _$HUProfileModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get handle => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HUProfileModelCopyWith<HUProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HUProfileModelCopyWith<$Res> {
  factory $HUProfileModelCopyWith(
          HUProfileModel value, $Res Function(HUProfileModel) then) =
      _$HUProfileModelCopyWithImpl<$Res, HUProfileModel>;
  @useResult
  $Res call(
      {String id, String name, String email, String handle, String? error});
}

/// @nodoc
class _$HUProfileModelCopyWithImpl<$Res, $Val extends HUProfileModel>
    implements $HUProfileModelCopyWith<$Res> {
  _$HUProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? handle = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      handle: null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HUProfileModelCopyWith<$Res>
    implements $HUProfileModelCopyWith<$Res> {
  factory _$$_HUProfileModelCopyWith(
          _$_HUProfileModel value, $Res Function(_$_HUProfileModel) then) =
      __$$_HUProfileModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String email, String handle, String? error});
}

/// @nodoc
class __$$_HUProfileModelCopyWithImpl<$Res>
    extends _$HUProfileModelCopyWithImpl<$Res, _$_HUProfileModel>
    implements _$$_HUProfileModelCopyWith<$Res> {
  __$$_HUProfileModelCopyWithImpl(
      _$_HUProfileModel _value, $Res Function(_$_HUProfileModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? handle = null,
    Object? error = freezed,
  }) {
    return _then(_$_HUProfileModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      handle: null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HUProfileModel implements _HUProfileModel {
  _$_HUProfileModel(
      {required this.id,
      this.name = '',
      this.email = '',
      this.handle = '',
      this.error});

  factory _$_HUProfileModel.fromJson(Map<String, dynamic> json) =>
      _$$_HUProfileModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String handle;
  @override
  final String? error;

  @override
  String toString() {
    return 'HUProfileModel(id: $id, name: $name, email: $email, handle: $handle, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HUProfileModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.handle, handle) || other.handle == handle) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, handle, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HUProfileModelCopyWith<_$_HUProfileModel> get copyWith =>
      __$$_HUProfileModelCopyWithImpl<_$_HUProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HUProfileModelToJson(
      this,
    );
  }
}

abstract class _HUProfileModel implements HUProfileModel {
  factory _HUProfileModel(
      {required final String id,
      final String name,
      final String email,
      final String handle,
      final String? error}) = _$_HUProfileModel;

  factory _HUProfileModel.fromJson(Map<String, dynamic> json) =
      _$_HUProfileModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get handle;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_HUProfileModelCopyWith<_$_HUProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
