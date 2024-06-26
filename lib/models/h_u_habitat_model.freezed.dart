// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'h_u_habitat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HUHabitatModel _$HUHabitatModelFromJson(Map<String, dynamic> json) {
  return _HUHabitatModel.fromJson(json);
}

/// @nodoc
mixin _$HUHabitatModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'creator_id')
  String get creatorId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get header => throw _privateConstructorUsedError;
  HabitType get type => throw _privateConstructorUsedError;
  Unit get unit => throw _privateConstructorUsedError;
  @JsonKey(name: "team_goal")
  int get teamGoal => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_goal_last_met')
  DateTime get teamGoalLastMet => throw _privateConstructorUsedError;
  List<String> get admins => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_open')
  bool get isOpen => throw _privateConstructorUsedError;
  int get cap => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HUHabitatModelCopyWith<HUHabitatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HUHabitatModelCopyWith<$Res> {
  factory $HUHabitatModelCopyWith(
          HUHabitatModel value, $Res Function(HUHabitatModel) then) =
      _$HUHabitatModelCopyWithImpl<$Res, HUHabitatModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'creator_id') String creatorId,
      String name,
      String header,
      HabitType type,
      Unit unit,
      @JsonKey(name: "team_goal") int teamGoal,
      @JsonKey(name: 'team_goal_last_met') DateTime teamGoalLastMet,
      List<String> admins,
      List<String> members,
      @JsonKey(name: 'is_open') bool isOpen,
      int cap});
}

/// @nodoc
class _$HUHabitatModelCopyWithImpl<$Res, $Val extends HUHabitatModel>
    implements $HUHabitatModelCopyWith<$Res> {
  _$HUHabitatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updatedAt = null,
    Object? creatorId = null,
    Object? name = null,
    Object? header = null,
    Object? type = null,
    Object? unit = null,
    Object? teamGoal = null,
    Object? teamGoalLastMet = null,
    Object? admins = null,
    Object? members = null,
    Object? isOpen = null,
    Object? cap = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HabitType,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      teamGoal: null == teamGoal
          ? _value.teamGoal
          : teamGoal // ignore: cast_nullable_to_non_nullable
              as int,
      teamGoalLastMet: null == teamGoalLastMet
          ? _value.teamGoalLastMet
          : teamGoalLastMet // ignore: cast_nullable_to_non_nullable
              as DateTime,
      admins: null == admins
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<String>,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      cap: null == cap
          ? _value.cap
          : cap // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HUHabitatModelImplCopyWith<$Res>
    implements $HUHabitatModelCopyWith<$Res> {
  factory _$$HUHabitatModelImplCopyWith(_$HUHabitatModelImpl value,
          $Res Function(_$HUHabitatModelImpl) then) =
      __$$HUHabitatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'creator_id') String creatorId,
      String name,
      String header,
      HabitType type,
      Unit unit,
      @JsonKey(name: "team_goal") int teamGoal,
      @JsonKey(name: 'team_goal_last_met') DateTime teamGoalLastMet,
      List<String> admins,
      List<String> members,
      @JsonKey(name: 'is_open') bool isOpen,
      int cap});
}

/// @nodoc
class __$$HUHabitatModelImplCopyWithImpl<$Res>
    extends _$HUHabitatModelCopyWithImpl<$Res, _$HUHabitatModelImpl>
    implements _$$HUHabitatModelImplCopyWith<$Res> {
  __$$HUHabitatModelImplCopyWithImpl(
      _$HUHabitatModelImpl _value, $Res Function(_$HUHabitatModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updatedAt = null,
    Object? creatorId = null,
    Object? name = null,
    Object? header = null,
    Object? type = null,
    Object? unit = null,
    Object? teamGoal = null,
    Object? teamGoalLastMet = null,
    Object? admins = null,
    Object? members = null,
    Object? isOpen = null,
    Object? cap = null,
  }) {
    return _then(_$HUHabitatModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HabitType,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      teamGoal: null == teamGoal
          ? _value.teamGoal
          : teamGoal // ignore: cast_nullable_to_non_nullable
              as int,
      teamGoalLastMet: null == teamGoalLastMet
          ? _value.teamGoalLastMet
          : teamGoalLastMet // ignore: cast_nullable_to_non_nullable
              as DateTime,
      admins: null == admins
          ? _value._admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<String>,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      cap: null == cap
          ? _value.cap
          : cap // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HUHabitatModelImpl implements _HUHabitatModel {
  _$HUHabitatModelImpl(
      {required this.id,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'creator_id') required this.creatorId,
      this.name = '',
      this.header = '',
      required this.type,
      this.unit = Unit.minutes,
      @JsonKey(name: "team_goal") this.teamGoal = 0,
      @JsonKey(name: 'team_goal_last_met') required this.teamGoalLastMet,
      final List<String> admins = const [],
      final List<String> members = const [],
      @JsonKey(name: 'is_open') this.isOpen = true,
      this.cap = 10})
      : _admins = admins,
        _members = members;

  factory _$HUHabitatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HUHabitatModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'creator_id')
  final String creatorId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String header;
  @override
  final HabitType type;
  @override
  @JsonKey()
  final Unit unit;
  @override
  @JsonKey(name: "team_goal")
  final int teamGoal;
  @override
  @JsonKey(name: 'team_goal_last_met')
  final DateTime teamGoalLastMet;
  final List<String> _admins;
  @override
  @JsonKey()
  List<String> get admins {
    if (_admins is EqualUnmodifiableListView) return _admins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_admins);
  }

  final List<String> _members;
  @override
  @JsonKey()
  List<String> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  @JsonKey(name: 'is_open')
  final bool isOpen;
  @override
  @JsonKey()
  final int cap;

  @override
  String toString() {
    return 'HUHabitatModel(id: $id, updatedAt: $updatedAt, creatorId: $creatorId, name: $name, header: $header, type: $type, unit: $unit, teamGoal: $teamGoal, teamGoalLastMet: $teamGoalLastMet, admins: $admins, members: $members, isOpen: $isOpen, cap: $cap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HUHabitatModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.teamGoal, teamGoal) ||
                other.teamGoal == teamGoal) &&
            (identical(other.teamGoalLastMet, teamGoalLastMet) ||
                other.teamGoalLastMet == teamGoalLastMet) &&
            const DeepCollectionEquality().equals(other._admins, _admins) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.cap, cap) || other.cap == cap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      updatedAt,
      creatorId,
      name,
      header,
      type,
      unit,
      teamGoal,
      teamGoalLastMet,
      const DeepCollectionEquality().hash(_admins),
      const DeepCollectionEquality().hash(_members),
      isOpen,
      cap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HUHabitatModelImplCopyWith<_$HUHabitatModelImpl> get copyWith =>
      __$$HUHabitatModelImplCopyWithImpl<_$HUHabitatModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HUHabitatModelImplToJson(
      this,
    );
  }
}

abstract class _HUHabitatModel implements HUHabitatModel {
  factory _HUHabitatModel(
      {required final int id,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'creator_id') required final String creatorId,
      final String name,
      final String header,
      required final HabitType type,
      final Unit unit,
      @JsonKey(name: "team_goal") final int teamGoal,
      @JsonKey(name: 'team_goal_last_met')
      required final DateTime teamGoalLastMet,
      final List<String> admins,
      final List<String> members,
      @JsonKey(name: 'is_open') final bool isOpen,
      final int cap}) = _$HUHabitatModelImpl;

  factory _HUHabitatModel.fromJson(Map<String, dynamic> json) =
      _$HUHabitatModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'creator_id')
  String get creatorId;
  @override
  String get name;
  @override
  String get header;
  @override
  HabitType get type;
  @override
  Unit get unit;
  @override
  @JsonKey(name: "team_goal")
  int get teamGoal;
  @override
  @JsonKey(name: 'team_goal_last_met')
  DateTime get teamGoalLastMet;
  @override
  List<String> get admins;
  @override
  List<String> get members;
  @override
  @JsonKey(name: 'is_open')
  bool get isOpen;
  @override
  int get cap;
  @override
  @JsonKey(ignore: true)
  _$$HUHabitatModelImplCopyWith<_$HUHabitatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
