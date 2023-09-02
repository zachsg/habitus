// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'h_u_action_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HUActionModel _$HUActionModelFromJson(Map<String, dynamic> json) {
  return _HUActionModel.fromJson(json);
}

/// @nodoc
mixin _$HUActionModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_id')
  int get teamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  String get ownerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  HUGoalModel get goal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HUActionModelCopyWith<HUActionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HUActionModelCopyWith<$Res> {
  factory $HUActionModelCopyWith(
          HUActionModel value, $Res Function(HUActionModel) then) =
      _$HUActionModelCopyWithImpl<$Res, HUActionModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'team_id') int teamId,
      @JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      HUGoalModel goal});

  $HUGoalModelCopyWith<$Res> get goal;
}

/// @nodoc
class _$HUActionModelCopyWithImpl<$Res, $Val extends HUActionModel>
    implements $HUActionModelCopyWith<$Res> {
  _$HUActionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamId = null,
    Object? ownerId = null,
    Object? createdAt = null,
    Object? goal = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as HUGoalModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HUGoalModelCopyWith<$Res> get goal {
    return $HUGoalModelCopyWith<$Res>(_value.goal, (value) {
      return _then(_value.copyWith(goal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HUActionModelCopyWith<$Res>
    implements $HUActionModelCopyWith<$Res> {
  factory _$$_HUActionModelCopyWith(
          _$_HUActionModel value, $Res Function(_$_HUActionModel) then) =
      __$$_HUActionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'team_id') int teamId,
      @JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      HUGoalModel goal});

  @override
  $HUGoalModelCopyWith<$Res> get goal;
}

/// @nodoc
class __$$_HUActionModelCopyWithImpl<$Res>
    extends _$HUActionModelCopyWithImpl<$Res, _$_HUActionModel>
    implements _$$_HUActionModelCopyWith<$Res> {
  __$$_HUActionModelCopyWithImpl(
      _$_HUActionModel _value, $Res Function(_$_HUActionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamId = null,
    Object? ownerId = null,
    Object? createdAt = null,
    Object? goal = null,
  }) {
    return _then(_$_HUActionModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as HUGoalModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HUActionModel implements _HUActionModel {
  _$_HUActionModel(
      {required this.id,
      @JsonKey(name: 'team_id') required this.teamId,
      @JsonKey(name: 'owner_id') required this.ownerId,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.goal});

  factory _$_HUActionModel.fromJson(Map<String, dynamic> json) =>
      _$$_HUActionModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'team_id')
  final int teamId;
  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  final HUGoalModel goal;

  @override
  String toString() {
    return 'HUActionModel(id: $id, teamId: $teamId, ownerId: $ownerId, createdAt: $createdAt, goal: $goal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HUActionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.goal, goal) || other.goal == goal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, teamId, ownerId, createdAt, goal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HUActionModelCopyWith<_$_HUActionModel> get copyWith =>
      __$$_HUActionModelCopyWithImpl<_$_HUActionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HUActionModelToJson(
      this,
    );
  }
}

abstract class _HUActionModel implements HUActionModel {
  factory _HUActionModel(
      {required final int id,
      @JsonKey(name: 'team_id') required final int teamId,
      @JsonKey(name: 'owner_id') required final String ownerId,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      required final HUGoalModel goal}) = _$_HUActionModel;

  factory _HUActionModel.fromJson(Map<String, dynamic> json) =
      _$_HUActionModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'team_id')
  int get teamId;
  @override
  @JsonKey(name: 'owner_id')
  String get ownerId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  HUGoalModel get goal;
  @override
  @JsonKey(ignore: true)
  _$$_HUActionModelCopyWith<_$_HUActionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
