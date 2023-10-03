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
  @JsonKey(name: 'is_joining')
  bool get isJoining => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'is_joining') bool isJoining,
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
    Object? isJoining = null,
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
      isJoining: null == isJoining
          ? _value.isJoining
          : isJoining // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$JoinHabitatModelImplCopyWith<$Res>
    implements $JoinHabitatModelCopyWith<$Res> {
  factory _$$JoinHabitatModelImplCopyWith(_$JoinHabitatModelImpl value,
          $Res Function(_$JoinHabitatModelImpl) then) =
      __$$JoinHabitatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HUHabitatModel habitat,
      List<HUHabitatModel> habitats,
      @JsonKey(name: 'is_joining') bool isJoining,
      bool loading,
      String? error});

  @override
  $HUHabitatModelCopyWith<$Res> get habitat;
}

/// @nodoc
class __$$JoinHabitatModelImplCopyWithImpl<$Res>
    extends _$JoinHabitatModelCopyWithImpl<$Res, _$JoinHabitatModelImpl>
    implements _$$JoinHabitatModelImplCopyWith<$Res> {
  __$$JoinHabitatModelImplCopyWithImpl(_$JoinHabitatModelImpl _value,
      $Res Function(_$JoinHabitatModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitat = null,
    Object? habitats = null,
    Object? isJoining = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_$JoinHabitatModelImpl(
      habitat: null == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as HUHabitatModel,
      habitats: null == habitats
          ? _value._habitats
          : habitats // ignore: cast_nullable_to_non_nullable
              as List<HUHabitatModel>,
      isJoining: null == isJoining
          ? _value.isJoining
          : isJoining // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$JoinHabitatModelImpl implements _JoinHabitatModel {
  _$JoinHabitatModelImpl(
      {required this.habitat,
      required final List<HUHabitatModel> habitats,
      @JsonKey(name: 'is_joining') this.isJoining = true,
      this.loading = false,
      this.error})
      : _habitats = habitats;

  factory _$JoinHabitatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinHabitatModelImplFromJson(json);

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
  @JsonKey(name: 'is_joining')
  final bool isJoining;
  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;

  @override
  String toString() {
    return 'JoinHabitatModel(habitat: $habitat, habitats: $habitats, isJoining: $isJoining, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinHabitatModelImpl &&
            (identical(other.habitat, habitat) || other.habitat == habitat) &&
            const DeepCollectionEquality().equals(other._habitats, _habitats) &&
            (identical(other.isJoining, isJoining) ||
                other.isJoining == isJoining) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      habitat,
      const DeepCollectionEquality().hash(_habitats),
      isJoining,
      loading,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinHabitatModelImplCopyWith<_$JoinHabitatModelImpl> get copyWith =>
      __$$JoinHabitatModelImplCopyWithImpl<_$JoinHabitatModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinHabitatModelImplToJson(
      this,
    );
  }
}

abstract class _JoinHabitatModel implements JoinHabitatModel {
  factory _JoinHabitatModel(
      {required final HUHabitatModel habitat,
      required final List<HUHabitatModel> habitats,
      @JsonKey(name: 'is_joining') final bool isJoining,
      final bool loading,
      final String? error}) = _$JoinHabitatModelImpl;

  factory _JoinHabitatModel.fromJson(Map<String, dynamic> json) =
      _$JoinHabitatModelImpl.fromJson;

  @override
  HUHabitatModel get habitat;
  @override
  List<HUHabitatModel> get habitats;
  @override
  @JsonKey(name: 'is_joining')
  bool get isJoining;
  @override
  bool get loading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$JoinHabitatModelImplCopyWith<_$JoinHabitatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
