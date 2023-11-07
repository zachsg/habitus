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
  List<HUHabitatModel> get habitats => throw _privateConstructorUsedError;
  Animal get animal => throw _privateConstructorUsedError;
  HabitType get type => throw _privateConstructorUsedError;
  Unit get unit => throw _privateConstructorUsedError;
  int get goal => throw _privateConstructorUsedError;
  int get cap => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_open')
  bool get isOpen => throw _privateConstructorUsedError;
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
      {List<HUHabitatModel> habitats,
      Animal animal,
      HabitType type,
      Unit unit,
      int goal,
      int cap,
      @JsonKey(name: 'is_open') bool isOpen,
      @JsonKey(name: 'is_joining') bool isJoining,
      bool loading,
      String? error});
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
    Object? habitats = null,
    Object? animal = null,
    Object? type = null,
    Object? unit = null,
    Object? goal = null,
    Object? cap = null,
    Object? isOpen = null,
    Object? isJoining = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      habitats: null == habitats
          ? _value.habitats
          : habitats // ignore: cast_nullable_to_non_nullable
              as List<HUHabitatModel>,
      animal: null == animal
          ? _value.animal
          : animal // ignore: cast_nullable_to_non_nullable
              as Animal,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HabitType,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as int,
      cap: null == cap
          ? _value.cap
          : cap // ignore: cast_nullable_to_non_nullable
              as int,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {List<HUHabitatModel> habitats,
      Animal animal,
      HabitType type,
      Unit unit,
      int goal,
      int cap,
      @JsonKey(name: 'is_open') bool isOpen,
      @JsonKey(name: 'is_joining') bool isJoining,
      bool loading,
      String? error});
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
    Object? habitats = null,
    Object? animal = null,
    Object? type = null,
    Object? unit = null,
    Object? goal = null,
    Object? cap = null,
    Object? isOpen = null,
    Object? isJoining = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_$JoinHabitatModelImpl(
      habitats: null == habitats
          ? _value._habitats
          : habitats // ignore: cast_nullable_to_non_nullable
              as List<HUHabitatModel>,
      animal: null == animal
          ? _value.animal
          : animal // ignore: cast_nullable_to_non_nullable
              as Animal,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HabitType,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as int,
      cap: null == cap
          ? _value.cap
          : cap // ignore: cast_nullable_to_non_nullable
              as int,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {required final List<HUHabitatModel> habitats,
      this.animal = Animal.quails,
      this.type = HabitType.read,
      this.unit = Unit.minutes,
      this.goal = 10,
      this.cap = 4,
      @JsonKey(name: 'is_open') this.isOpen = true,
      @JsonKey(name: 'is_joining') this.isJoining = true,
      this.loading = false,
      this.error})
      : _habitats = habitats;

  factory _$JoinHabitatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinHabitatModelImplFromJson(json);

  final List<HUHabitatModel> _habitats;
  @override
  List<HUHabitatModel> get habitats {
    if (_habitats is EqualUnmodifiableListView) return _habitats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habitats);
  }

  @override
  @JsonKey()
  final Animal animal;
  @override
  @JsonKey()
  final HabitType type;
  @override
  @JsonKey()
  final Unit unit;
  @override
  @JsonKey()
  final int goal;
  @override
  @JsonKey()
  final int cap;
  @override
  @JsonKey(name: 'is_open')
  final bool isOpen;
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
    return 'JoinHabitatModel(habitats: $habitats, animal: $animal, type: $type, unit: $unit, goal: $goal, cap: $cap, isOpen: $isOpen, isJoining: $isJoining, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinHabitatModelImpl &&
            const DeepCollectionEquality().equals(other._habitats, _habitats) &&
            (identical(other.animal, animal) || other.animal == animal) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.cap, cap) || other.cap == cap) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isJoining, isJoining) ||
                other.isJoining == isJoining) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_habitats),
      animal,
      type,
      unit,
      goal,
      cap,
      isOpen,
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
      {required final List<HUHabitatModel> habitats,
      final Animal animal,
      final HabitType type,
      final Unit unit,
      final int goal,
      final int cap,
      @JsonKey(name: 'is_open') final bool isOpen,
      @JsonKey(name: 'is_joining') final bool isJoining,
      final bool loading,
      final String? error}) = _$JoinHabitatModelImpl;

  factory _JoinHabitatModel.fromJson(Map<String, dynamic> json) =
      _$JoinHabitatModelImpl.fromJson;

  @override
  List<HUHabitatModel> get habitats;
  @override
  Animal get animal;
  @override
  HabitType get type;
  @override
  Unit get unit;
  @override
  int get goal;
  @override
  int get cap;
  @override
  @JsonKey(name: 'is_open')
  bool get isOpen;
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
