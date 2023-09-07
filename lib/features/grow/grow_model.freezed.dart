// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grow_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GrowModel _$GrowModelFromJson(Map<String, dynamic> json) {
  return _GrowModel.fromJson(json);
}

/// @nodoc
mixin _$GrowModel {
  HUHabitatModel get habitat => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GrowModelCopyWith<GrowModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrowModelCopyWith<$Res> {
  factory $GrowModelCopyWith(GrowModel value, $Res Function(GrowModel) then) =
      _$GrowModelCopyWithImpl<$Res, GrowModel>;
  @useResult
  $Res call({HUHabitatModel habitat, bool loading, String? error});

  $HUHabitatModelCopyWith<$Res> get habitat;
}

/// @nodoc
class _$GrowModelCopyWithImpl<$Res, $Val extends GrowModel>
    implements $GrowModelCopyWith<$Res> {
  _$GrowModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitat = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
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
  $HUHabitatModelCopyWith<$Res> get habitat {
    return $HUHabitatModelCopyWith<$Res>(_value.habitat, (value) {
      return _then(_value.copyWith(habitat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GrowModelCopyWith<$Res> implements $GrowModelCopyWith<$Res> {
  factory _$$_GrowModelCopyWith(
          _$_GrowModel value, $Res Function(_$_GrowModel) then) =
      __$$_GrowModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HUHabitatModel habitat, bool loading, String? error});

  @override
  $HUHabitatModelCopyWith<$Res> get habitat;
}

/// @nodoc
class __$$_GrowModelCopyWithImpl<$Res>
    extends _$GrowModelCopyWithImpl<$Res, _$_GrowModel>
    implements _$$_GrowModelCopyWith<$Res> {
  __$$_GrowModelCopyWithImpl(
      _$_GrowModel _value, $Res Function(_$_GrowModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitat = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_$_GrowModel(
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
class _$_GrowModel implements _GrowModel {
  _$_GrowModel({required this.habitat, this.loading = false, this.error});

  factory _$_GrowModel.fromJson(Map<String, dynamic> json) =>
      _$$_GrowModelFromJson(json);

  @override
  final HUHabitatModel habitat;
  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;

  @override
  String toString() {
    return 'GrowModel(habitat: $habitat, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GrowModel &&
            (identical(other.habitat, habitat) || other.habitat == habitat) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, habitat, loading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GrowModelCopyWith<_$_GrowModel> get copyWith =>
      __$$_GrowModelCopyWithImpl<_$_GrowModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GrowModelToJson(
      this,
    );
  }
}

abstract class _GrowModel implements GrowModel {
  factory _GrowModel(
      {required final HUHabitatModel habitat,
      final bool loading,
      final String? error}) = _$_GrowModel;

  factory _GrowModel.fromJson(Map<String, dynamic> json) =
      _$_GrowModel.fromJson;

  @override
  HUHabitatModel get habitat;
  @override
  bool get loading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_GrowModelCopyWith<_$_GrowModel> get copyWith =>
      throw _privateConstructorUsedError;
}
