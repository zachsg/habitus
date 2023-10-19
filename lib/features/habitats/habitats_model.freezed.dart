// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habitats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HabitatsModel _$HabitatsModelFromJson(Map<String, dynamic> json) {
  return _HabitatsModel.fromJson(json);
}

/// @nodoc
mixin _$HabitatsModel {
  List<HUHabitatModel> get habitats => throw _privateConstructorUsedError;
  List<HUActionModel> get actions => throw _privateConstructorUsedError;
  List<HUActionModel> get pastWeekActions => throw _privateConstructorUsedError;
  List<HUCalloutModel> get callouts => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HabitatsModelCopyWith<HabitatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitatsModelCopyWith<$Res> {
  factory $HabitatsModelCopyWith(
          HabitatsModel value, $Res Function(HabitatsModel) then) =
      _$HabitatsModelCopyWithImpl<$Res, HabitatsModel>;
  @useResult
  $Res call(
      {List<HUHabitatModel> habitats,
      List<HUActionModel> actions,
      List<HUActionModel> pastWeekActions,
      List<HUCalloutModel> callouts,
      bool loading,
      String? error});
}

/// @nodoc
class _$HabitatsModelCopyWithImpl<$Res, $Val extends HabitatsModel>
    implements $HabitatsModelCopyWith<$Res> {
  _$HabitatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitats = null,
    Object? actions = null,
    Object? pastWeekActions = null,
    Object? callouts = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      habitats: null == habitats
          ? _value.habitats
          : habitats // ignore: cast_nullable_to_non_nullable
              as List<HUHabitatModel>,
      actions: null == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<HUActionModel>,
      pastWeekActions: null == pastWeekActions
          ? _value.pastWeekActions
          : pastWeekActions // ignore: cast_nullable_to_non_nullable
              as List<HUActionModel>,
      callouts: null == callouts
          ? _value.callouts
          : callouts // ignore: cast_nullable_to_non_nullable
              as List<HUCalloutModel>,
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
}

/// @nodoc
abstract class _$$HabitatsModelImplCopyWith<$Res>
    implements $HabitatsModelCopyWith<$Res> {
  factory _$$HabitatsModelImplCopyWith(
          _$HabitatsModelImpl value, $Res Function(_$HabitatsModelImpl) then) =
      __$$HabitatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HUHabitatModel> habitats,
      List<HUActionModel> actions,
      List<HUActionModel> pastWeekActions,
      List<HUCalloutModel> callouts,
      bool loading,
      String? error});
}

/// @nodoc
class __$$HabitatsModelImplCopyWithImpl<$Res>
    extends _$HabitatsModelCopyWithImpl<$Res, _$HabitatsModelImpl>
    implements _$$HabitatsModelImplCopyWith<$Res> {
  __$$HabitatsModelImplCopyWithImpl(
      _$HabitatsModelImpl _value, $Res Function(_$HabitatsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitats = null,
    Object? actions = null,
    Object? pastWeekActions = null,
    Object? callouts = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_$HabitatsModelImpl(
      habitats: null == habitats
          ? _value._habitats
          : habitats // ignore: cast_nullable_to_non_nullable
              as List<HUHabitatModel>,
      actions: null == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<HUActionModel>,
      pastWeekActions: null == pastWeekActions
          ? _value._pastWeekActions
          : pastWeekActions // ignore: cast_nullable_to_non_nullable
              as List<HUActionModel>,
      callouts: null == callouts
          ? _value._callouts
          : callouts // ignore: cast_nullable_to_non_nullable
              as List<HUCalloutModel>,
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
class _$HabitatsModelImpl implements _HabitatsModel {
  _$HabitatsModelImpl(
      {required final List<HUHabitatModel> habitats,
      required final List<HUActionModel> actions,
      required final List<HUActionModel> pastWeekActions,
      required final List<HUCalloutModel> callouts,
      this.loading = false,
      this.error})
      : _habitats = habitats,
        _actions = actions,
        _pastWeekActions = pastWeekActions,
        _callouts = callouts;

  factory _$HabitatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitatsModelImplFromJson(json);

  final List<HUHabitatModel> _habitats;
  @override
  List<HUHabitatModel> get habitats {
    if (_habitats is EqualUnmodifiableListView) return _habitats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habitats);
  }

  final List<HUActionModel> _actions;
  @override
  List<HUActionModel> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  final List<HUActionModel> _pastWeekActions;
  @override
  List<HUActionModel> get pastWeekActions {
    if (_pastWeekActions is EqualUnmodifiableListView) return _pastWeekActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastWeekActions);
  }

  final List<HUCalloutModel> _callouts;
  @override
  List<HUCalloutModel> get callouts {
    if (_callouts is EqualUnmodifiableListView) return _callouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_callouts);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;

  @override
  String toString() {
    return 'HabitatsModel(habitats: $habitats, actions: $actions, pastWeekActions: $pastWeekActions, callouts: $callouts, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitatsModelImpl &&
            const DeepCollectionEquality().equals(other._habitats, _habitats) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            const DeepCollectionEquality()
                .equals(other._pastWeekActions, _pastWeekActions) &&
            const DeepCollectionEquality().equals(other._callouts, _callouts) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_habitats),
      const DeepCollectionEquality().hash(_actions),
      const DeepCollectionEquality().hash(_pastWeekActions),
      const DeepCollectionEquality().hash(_callouts),
      loading,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitatsModelImplCopyWith<_$HabitatsModelImpl> get copyWith =>
      __$$HabitatsModelImplCopyWithImpl<_$HabitatsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitatsModelImplToJson(
      this,
    );
  }
}

abstract class _HabitatsModel implements HabitatsModel {
  factory _HabitatsModel(
      {required final List<HUHabitatModel> habitats,
      required final List<HUActionModel> actions,
      required final List<HUActionModel> pastWeekActions,
      required final List<HUCalloutModel> callouts,
      final bool loading,
      final String? error}) = _$HabitatsModelImpl;

  factory _HabitatsModel.fromJson(Map<String, dynamic> json) =
      _$HabitatsModelImpl.fromJson;

  @override
  List<HUHabitatModel> get habitats;
  @override
  List<HUActionModel> get actions;
  @override
  List<HUActionModel> get pastWeekActions;
  @override
  List<HUCalloutModel> get callouts;
  @override
  bool get loading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$HabitatsModelImplCopyWith<_$HabitatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
