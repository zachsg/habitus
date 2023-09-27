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
  DateTime get day => throw _privateConstructorUsedError;
  List<HUProfileModel> get profiles => throw _privateConstructorUsedError;
  List<HUActionModel> get actions => throw _privateConstructorUsedError;
  List<HUCalloutModel> get callouts => throw _privateConstructorUsedError;
  int get percentage => throw _privateConstructorUsedError;
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
      DateTime day,
      List<HUProfileModel> profiles,
      List<HUActionModel> actions,
      List<HUCalloutModel> callouts,
      int percentage,
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
    Object? day = null,
    Object? profiles = null,
    Object? actions = null,
    Object? callouts = null,
    Object? percentage = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      habitat: null == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as HUHabitatModel,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profiles: null == profiles
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<HUProfileModel>,
      actions: null == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<HUActionModel>,
      callouts: null == callouts
          ? _value.callouts
          : callouts // ignore: cast_nullable_to_non_nullable
              as List<HUCalloutModel>,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$HabitatModelImplCopyWith<$Res>
    implements $HabitatModelCopyWith<$Res> {
  factory _$$HabitatModelImplCopyWith(
          _$HabitatModelImpl value, $Res Function(_$HabitatModelImpl) then) =
      __$$HabitatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HUHabitatModel habitat,
      DateTime day,
      List<HUProfileModel> profiles,
      List<HUActionModel> actions,
      List<HUCalloutModel> callouts,
      int percentage,
      bool loading,
      String? error});

  @override
  $HUHabitatModelCopyWith<$Res> get habitat;
}

/// @nodoc
class __$$HabitatModelImplCopyWithImpl<$Res>
    extends _$HabitatModelCopyWithImpl<$Res, _$HabitatModelImpl>
    implements _$$HabitatModelImplCopyWith<$Res> {
  __$$HabitatModelImplCopyWithImpl(
      _$HabitatModelImpl _value, $Res Function(_$HabitatModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitat = null,
    Object? day = null,
    Object? profiles = null,
    Object? actions = null,
    Object? callouts = null,
    Object? percentage = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_$HabitatModelImpl(
      habitat: null == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as HUHabitatModel,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profiles: null == profiles
          ? _value._profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<HUProfileModel>,
      actions: null == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<HUActionModel>,
      callouts: null == callouts
          ? _value._callouts
          : callouts // ignore: cast_nullable_to_non_nullable
              as List<HUCalloutModel>,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$HabitatModelImpl implements _HabitatModel {
  _$HabitatModelImpl(
      {required this.habitat,
      required this.day,
      final List<HUProfileModel> profiles = const [],
      final List<HUActionModel> actions = const [],
      final List<HUCalloutModel> callouts = const [],
      this.percentage = 0,
      this.loading = false,
      this.error})
      : _profiles = profiles,
        _actions = actions,
        _callouts = callouts;

  factory _$HabitatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitatModelImplFromJson(json);

  @override
  final HUHabitatModel habitat;
  @override
  final DateTime day;
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

  final List<HUCalloutModel> _callouts;
  @override
  @JsonKey()
  List<HUCalloutModel> get callouts {
    if (_callouts is EqualUnmodifiableListView) return _callouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_callouts);
  }

  @override
  @JsonKey()
  final int percentage;
  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;

  @override
  String toString() {
    return 'HabitatModel(habitat: $habitat, day: $day, profiles: $profiles, actions: $actions, callouts: $callouts, percentage: $percentage, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitatModelImpl &&
            (identical(other.habitat, habitat) || other.habitat == habitat) &&
            (identical(other.day, day) || other.day == day) &&
            const DeepCollectionEquality().equals(other._profiles, _profiles) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            const DeepCollectionEquality().equals(other._callouts, _callouts) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      habitat,
      day,
      const DeepCollectionEquality().hash(_profiles),
      const DeepCollectionEquality().hash(_actions),
      const DeepCollectionEquality().hash(_callouts),
      percentage,
      loading,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitatModelImplCopyWith<_$HabitatModelImpl> get copyWith =>
      __$$HabitatModelImplCopyWithImpl<_$HabitatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitatModelImplToJson(
      this,
    );
  }
}

abstract class _HabitatModel implements HabitatModel {
  factory _HabitatModel(
      {required final HUHabitatModel habitat,
      required final DateTime day,
      final List<HUProfileModel> profiles,
      final List<HUActionModel> actions,
      final List<HUCalloutModel> callouts,
      final int percentage,
      final bool loading,
      final String? error}) = _$HabitatModelImpl;

  factory _HabitatModel.fromJson(Map<String, dynamic> json) =
      _$HabitatModelImpl.fromJson;

  @override
  HUHabitatModel get habitat;
  @override
  DateTime get day;
  @override
  List<HUProfileModel> get profiles;
  @override
  List<HUActionModel> get actions;
  @override
  List<HUCalloutModel> get callouts;
  @override
  int get percentage;
  @override
  bool get loading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$HabitatModelImplCopyWith<_$HabitatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
