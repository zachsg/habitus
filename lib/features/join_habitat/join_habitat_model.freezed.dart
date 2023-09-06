// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_habitat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JoinHabitatModel _$JoinHabitatModelFromJson(Map<String, dynamic> json) {
  return _JoinHabitatModel.fromJson(json);
}

/// @nodoc
mixin _$JoinHabitatModel {
  HUHabitatModel get habitat => throw _privateConstructorUsedError;
  List<HUHabitatModel> get habitats => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JoinHabitatModelCopyWith<JoinHabitatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinHabitatModelCopyWith<$Res> {
  factory $JoinHabitatModelCopyWith(
          JoinHabitatModel value, $Res Function(JoinHabitatModel) then) =
      _$JoinHabitatModelCopyWithImpl<$Res, JoinHabitatModel>;
  @useResult
  $Res call(
      {HUHabitatModel habitat,
      List<HUHabitatModel> habitats,
      bool loading,
      String? error});

  $HUHabitatModelCopyWith<$Res> get habitat;
}

/// @nodoc
class _$JoinHabitatModelCopyWithImpl<$Res, $Val extends JoinHabitatModel>
    implements $JoinHabitatModelCopyWith<$Res> {
  _$JoinHabitatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitat = null,
    Object? habitats = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      habitat: null == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as HUHabitatModel,
      habitats: null == habitats
          ? _value.habitats
          : habitats // ignore: cast_nullable_to_non_nullable
              as List<HUHabitatModel>,
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
abstract class _$$_JoinHabitatModelCopyWith<$Res>
    implements $JoinHabitatModelCopyWith<$Res> {
  factory _$$_JoinHabitatModelCopyWith(
          _$_JoinHabitatModel value, $Res Function(_$_JoinHabitatModel) then) =
      __$$_JoinHabitatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HUHabitatModel habitat,
      List<HUHabitatModel> habitats,
      bool loading,
      String? error});

  @override
  $HUHabitatModelCopyWith<$Res> get habitat;
}

/// @nodoc
class __$$_JoinHabitatModelCopyWithImpl<$Res>
    extends _$JoinHabitatModelCopyWithImpl<$Res, _$_JoinHabitatModel>
    implements _$$_JoinHabitatModelCopyWith<$Res> {
  __$$_JoinHabitatModelCopyWithImpl(
      _$_JoinHabitatModel _value, $Res Function(_$_JoinHabitatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitat = null,
    Object? habitats = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_$_JoinHabitatModel(
      habitat: null == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as HUHabitatModel,
      habitats: null == habitats
          ? _value._habitats
          : habitats // ignore: cast_nullable_to_non_nullable
              as List<HUHabitatModel>,
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
class _$_JoinHabitatModel implements _JoinHabitatModel {
  _$_JoinHabitatModel(
      {required this.habitat,
      required final List<HUHabitatModel> habitats,
      this.loading = false,
      this.error})
      : _habitats = habitats;

  factory _$_JoinHabitatModel.fromJson(Map<String, dynamic> json) =>
      _$$_JoinHabitatModelFromJson(json);

  @override
  final HUHabitatModel habitat;
  final List<HUHabitatModel> _habitats;
  @override
  List<HUHabitatModel> get habitats {
    if (_habitats is EqualUnmodifiableListView) return _habitats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habitats);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;

  @override
  String toString() {
    return 'JoinHabitatModel(habitat: $habitat, habitats: $habitats, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JoinHabitatModel &&
            (identical(other.habitat, habitat) || other.habitat == habitat) &&
            const DeepCollectionEquality().equals(other._habitats, _habitats) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, habitat,
      const DeepCollectionEquality().hash(_habitats), loading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JoinHabitatModelCopyWith<_$_JoinHabitatModel> get copyWith =>
      __$$_JoinHabitatModelCopyWithImpl<_$_JoinHabitatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JoinHabitatModelToJson(
      this,
    );
  }
}

abstract class _JoinHabitatModel implements JoinHabitatModel {
  factory _JoinHabitatModel(
      {required final HUHabitatModel habitat,
      required final List<HUHabitatModel> habitats,
      final bool loading,
      final String? error}) = _$_JoinHabitatModel;

  factory _JoinHabitatModel.fromJson(Map<String, dynamic> json) =
      _$_JoinHabitatModel.fromJson;

  @override
  HUHabitatModel get habitat;
  @override
  List<HUHabitatModel> get habitats;
  @override
  bool get loading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_JoinHabitatModelCopyWith<_$_JoinHabitatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
