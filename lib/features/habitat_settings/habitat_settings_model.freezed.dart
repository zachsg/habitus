// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habitat_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HabitatSettingsModel _$HabitatSettingsModelFromJson(Map<String, dynamic> json) {
  return _HabitatSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$HabitatSettingsModel {
  HUProfileModel get profile => throw _privateConstructorUsedError;
  HUHabitatModel get habitat => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HabitatSettingsModelCopyWith<HabitatSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitatSettingsModelCopyWith<$Res> {
  factory $HabitatSettingsModelCopyWith(HabitatSettingsModel value,
          $Res Function(HabitatSettingsModel) then) =
      _$HabitatSettingsModelCopyWithImpl<$Res, HabitatSettingsModel>;
  @useResult
  $Res call(
      {HUProfileModel profile,
      HUHabitatModel habitat,
      bool loading,
      String? error});

  $HUProfileModelCopyWith<$Res> get profile;
  $HUHabitatModelCopyWith<$Res> get habitat;
}

/// @nodoc
class _$HabitatSettingsModelCopyWithImpl<$Res,
        $Val extends HabitatSettingsModel>
    implements $HabitatSettingsModelCopyWith<$Res> {
  _$HabitatSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? habitat = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as HUProfileModel,
      habitat: null == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as HUHabitatModel,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HUProfileModelCopyWith<$Res> get profile {
    return $HUProfileModelCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HUHabitatModelCopyWith<$Res> get habitat {
    return $HUHabitatModelCopyWith<$Res>(_value.habitat, (value) {
      return _then(_value.copyWith(habitat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HabitatSettingsModelImplCopyWith<$Res>
    implements $HabitatSettingsModelCopyWith<$Res> {
  factory _$$HabitatSettingsModelImplCopyWith(_$HabitatSettingsModelImpl value,
          $Res Function(_$HabitatSettingsModelImpl) then) =
      __$$HabitatSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HUProfileModel profile,
      HUHabitatModel habitat,
      bool loading,
      String? error});

  @override
  $HUProfileModelCopyWith<$Res> get profile;
  @override
  $HUHabitatModelCopyWith<$Res> get habitat;
}

/// @nodoc
class __$$HabitatSettingsModelImplCopyWithImpl<$Res>
    extends _$HabitatSettingsModelCopyWithImpl<$Res, _$HabitatSettingsModelImpl>
    implements _$$HabitatSettingsModelImplCopyWith<$Res> {
  __$$HabitatSettingsModelImplCopyWithImpl(_$HabitatSettingsModelImpl _value,
      $Res Function(_$HabitatSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? habitat = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_$HabitatSettingsModelImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as HUProfileModel,
      habitat: null == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as HUHabitatModel,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HabitatSettingsModelImpl implements _HabitatSettingsModel {
  _$HabitatSettingsModelImpl(
      {required this.profile,
      required this.habitat,
      this.loading = false,
      this.error});

  factory _$HabitatSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitatSettingsModelImplFromJson(json);

  @override
  final HUProfileModel profile;
  @override
  final HUHabitatModel habitat;
  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;

  @override
  String toString() {
    return 'HabitatSettingsModel(profile: $profile, habitat: $habitat, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitatSettingsModelImpl &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.habitat, habitat) || other.habitat == habitat) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, profile, habitat, loading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitatSettingsModelImplCopyWith<_$HabitatSettingsModelImpl>
      get copyWith =>
          __$$HabitatSettingsModelImplCopyWithImpl<_$HabitatSettingsModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitatSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _HabitatSettingsModel implements HabitatSettingsModel {
  factory _HabitatSettingsModel(
      {required final HUProfileModel profile,
      required final HUHabitatModel habitat,
      final bool loading,
      final String? error}) = _$HabitatSettingsModelImpl;

  factory _HabitatSettingsModel.fromJson(Map<String, dynamic> json) =
      _$HabitatSettingsModelImpl.fromJson;

  @override
  HUProfileModel get profile;
  @override
  HUHabitatModel get habitat;
  @override
  bool get loading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$HabitatSettingsModelImplCopyWith<_$HabitatSettingsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
