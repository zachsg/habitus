// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habitat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HabitatModel _$HabitatModelFromJson(Map<String, dynamic> json) {
  return _HabitatModel.fromJson(json);
}

/// @nodoc
mixin _$HabitatModel {
  HUHabitatModel get habitat => throw _privateConstructorUsedError;
  List<HUProfileModel> get profiles => throw _privateConstructorUsedError;
  List<HUActionModel> get actions => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HabitatModelCopyWith<HabitatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitatModelCopyWith<$Res> {
  factory $HabitatModelCopyWith(
          HabitatModel value, $Res Function(HabitatModel) then) =
      _$HabitatModelCopyWithImpl<$Res, HabitatModel>;
  @useResult
  $Res call(
      {HUHabitatModel habitat,
      List<HUProfileModel> profiles,
      List<HUActionModel> actions,
      bool loading,
      String? error});

  $HUHabitatModelCopyWith<$Res> get habitat;
}

/// @nodoc
class _$HabitatModelCopyWithImpl<$Res, $Val extends HabitatModel>
    implements $HabitatModelCopyWith<$Res> {
  _$HabitatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitat = null,
    Object? profiles = null,
    Object? actions = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      habitat: null == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as HUHabitatModel,
      profiles: null == profiles
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<HUProfileModel>,
      actions: null == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<HUActionModel>,
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
abstract class _$$_HabitatModelCopyWith<$Res>
    implements $HabitatModelCopyWith<$Res> {
  factory _$$_HabitatModelCopyWith(
          _$_HabitatModel value, $Res Function(_$_HabitatModel) then) =
      __$$_HabitatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HUHabitatModel habitat,
      List<HUProfileModel> profiles,
      List<HUActionModel> actions,
      bool loading,
      String? error});

  @override
  $HUHabitatModelCopyWith<$Res> get habitat;
}

/// @nodoc
class __$$_HabitatModelCopyWithImpl<$Res>
    extends _$HabitatModelCopyWithImpl<$Res, _$_HabitatModel>
    implements _$$_HabitatModelCopyWith<$Res> {
  __$$_HabitatModelCopyWithImpl(
      _$_HabitatModel _value, $Res Function(_$_HabitatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitat = null,
    Object? profiles = null,
    Object? actions = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_$_HabitatModel(
      habitat: null == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as HUHabitatModel,
      profiles: null == profiles
          ? _value._profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<HUProfileModel>,
      actions: null == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<HUActionModel>,
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
class _$_HabitatModel implements _HabitatModel {
  _$_HabitatModel(
      {required this.habitat,
      final List<HUProfileModel> profiles = const [],
      final List<HUActionModel> actions = const [],
      this.loading = false,
      this.error})
      : _profiles = profiles,
        _actions = actions;

  factory _$_HabitatModel.fromJson(Map<String, dynamic> json) =>
      _$$_HabitatModelFromJson(json);

  @override
  final HUHabitatModel habitat;
  final List<HUProfileModel> _profiles;
  @override
  @JsonKey()
  List<HUProfileModel> get profiles {
    if (_profiles is EqualUnmodifiableListView) return _profiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }

  final List<HUActionModel> _actions;
  @override
  @JsonKey()
  List<HUActionModel> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;

  @override
  String toString() {
    return 'HabitatModel(habitat: $habitat, profiles: $profiles, actions: $actions, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HabitatModel &&
            (identical(other.habitat, habitat) || other.habitat == habitat) &&
            const DeepCollectionEquality().equals(other._profiles, _profiles) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      habitat,
      const DeepCollectionEquality().hash(_profiles),
      const DeepCollectionEquality().hash(_actions),
      loading,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HabitatModelCopyWith<_$_HabitatModel> get copyWith =>
      __$$_HabitatModelCopyWithImpl<_$_HabitatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HabitatModelToJson(
      this,
    );
  }
}

abstract class _HabitatModel implements HabitatModel {
  factory _HabitatModel(
      {required final HUHabitatModel habitat,
      final List<HUProfileModel> profiles,
      final List<HUActionModel> actions,
      final bool loading,
      final String? error}) = _$_HabitatModel;

  factory _HabitatModel.fromJson(Map<String, dynamic> json) =
      _$_HabitatModel.fromJson;

  @override
  HUHabitatModel get habitat;
  @override
  List<HUProfileModel> get profiles;
  @override
  List<HUActionModel> get actions;
  @override
  bool get loading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_HabitatModelCopyWith<_$_HabitatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
