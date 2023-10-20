// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalendarModel _$CalendarModelFromJson(Map<String, dynamic> json) {
  return _CalendarModel.fromJson(json);
}

/// @nodoc
mixin _$CalendarModel {
  List<HUHabitatModel> get habitats => throw _privateConstructorUsedError;
  HUHabitatModel get habitat => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<HUActionModel> get actions => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarModelCopyWith<CalendarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarModelCopyWith<$Res> {
  factory $CalendarModelCopyWith(
          CalendarModel value, $Res Function(CalendarModel) then) =
      _$CalendarModelCopyWithImpl<$Res, CalendarModel>;
  @useResult
  $Res call(
      {List<HUHabitatModel> habitats,
      HUHabitatModel habitat,
      DateTime date,
      List<HUActionModel> actions,
      bool loading,
      String? error});

  $HUHabitatModelCopyWith<$Res> get habitat;
}

/// @nodoc
class _$CalendarModelCopyWithImpl<$Res, $Val extends CalendarModel>
    implements $CalendarModelCopyWith<$Res> {
  _$CalendarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitats = null,
    Object? habitat = null,
    Object? date = null,
    Object? actions = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      habitats: null == habitats
          ? _value.habitats
          : habitats // ignore: cast_nullable_to_non_nullable
              as List<HUHabitatModel>,
      habitat: null == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as HUHabitatModel,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$CalendarModelImplCopyWith<$Res>
    implements $CalendarModelCopyWith<$Res> {
  factory _$$CalendarModelImplCopyWith(
          _$CalendarModelImpl value, $Res Function(_$CalendarModelImpl) then) =
      __$$CalendarModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HUHabitatModel> habitats,
      HUHabitatModel habitat,
      DateTime date,
      List<HUActionModel> actions,
      bool loading,
      String? error});

  @override
  $HUHabitatModelCopyWith<$Res> get habitat;
}

/// @nodoc
class __$$CalendarModelImplCopyWithImpl<$Res>
    extends _$CalendarModelCopyWithImpl<$Res, _$CalendarModelImpl>
    implements _$$CalendarModelImplCopyWith<$Res> {
  __$$CalendarModelImplCopyWithImpl(
      _$CalendarModelImpl _value, $Res Function(_$CalendarModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitats = null,
    Object? habitat = null,
    Object? date = null,
    Object? actions = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_$CalendarModelImpl(
      habitats: null == habitats
          ? _value._habitats
          : habitats // ignore: cast_nullable_to_non_nullable
              as List<HUHabitatModel>,
      habitat: null == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as HUHabitatModel,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
class _$CalendarModelImpl implements _CalendarModel {
  _$CalendarModelImpl(
      {required final List<HUHabitatModel> habitats,
      required this.habitat,
      required this.date,
      final List<HUActionModel> actions = const [],
      this.loading = false,
      this.error})
      : _habitats = habitats,
        _actions = actions;

  factory _$CalendarModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarModelImplFromJson(json);

  final List<HUHabitatModel> _habitats;
  @override
  List<HUHabitatModel> get habitats {
    if (_habitats is EqualUnmodifiableListView) return _habitats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habitats);
  }

  @override
  final HUHabitatModel habitat;
  @override
  final DateTime date;
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
    return 'CalendarModel(habitats: $habitats, habitat: $habitat, date: $date, actions: $actions, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarModelImpl &&
            const DeepCollectionEquality().equals(other._habitats, _habitats) &&
            (identical(other.habitat, habitat) || other.habitat == habitat) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_habitats),
      habitat,
      date,
      const DeepCollectionEquality().hash(_actions),
      loading,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarModelImplCopyWith<_$CalendarModelImpl> get copyWith =>
      __$$CalendarModelImplCopyWithImpl<_$CalendarModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarModelImplToJson(
      this,
    );
  }
}

abstract class _CalendarModel implements CalendarModel {
  factory _CalendarModel(
      {required final List<HUHabitatModel> habitats,
      required final HUHabitatModel habitat,
      required final DateTime date,
      final List<HUActionModel> actions,
      final bool loading,
      final String? error}) = _$CalendarModelImpl;

  factory _CalendarModel.fromJson(Map<String, dynamic> json) =
      _$CalendarModelImpl.fromJson;

  @override
  List<HUHabitatModel> get habitats;
  @override
  HUHabitatModel get habitat;
  @override
  DateTime get date;
  @override
  List<HUActionModel> get actions;
  @override
  bool get loading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$CalendarModelImplCopyWith<_$CalendarModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
