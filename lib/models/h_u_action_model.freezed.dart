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
  @JsonKey(name: 'habitat_id')
  int get habitatId => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  String get ownerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<HUReactionModel> get reactions => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'habitat_id') int habitatId,
      @JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      List<HUReactionModel> reactions,
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
    Object? habitatId = null,
    Object? ownerId = null,
    Object? createdAt = null,
    Object? reactions = null,
    Object? goal = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      habitatId: null == habitatId
          ? _value.habitatId
          : habitatId // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reactions: null == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<HUReactionModel>,
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
abstract class _$$HUActionModelImplCopyWith<$Res>
    implements $HUActionModelCopyWith<$Res> {
  factory _$$HUActionModelImplCopyWith(
          _$HUActionModelImpl value, $Res Function(_$HUActionModelImpl) then) =
      __$$HUActionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'habitat_id') int habitatId,
      @JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      List<HUReactionModel> reactions,
      HUGoalModel goal});

  @override
  $HUGoalModelCopyWith<$Res> get goal;
}

/// @nodoc
class __$$HUActionModelImplCopyWithImpl<$Res>
    extends _$HUActionModelCopyWithImpl<$Res, _$HUActionModelImpl>
    implements _$$HUActionModelImplCopyWith<$Res> {
  __$$HUActionModelImplCopyWithImpl(
      _$HUActionModelImpl _value, $Res Function(_$HUActionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? habitatId = null,
    Object? ownerId = null,
    Object? createdAt = null,
    Object? reactions = null,
    Object? goal = null,
  }) {
    return _then(_$HUActionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      habitatId: null == habitatId
          ? _value.habitatId
          : habitatId // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reactions: null == reactions
          ? _value._reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<HUReactionModel>,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as HUGoalModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HUActionModelImpl implements _HUActionModel {
  _$HUActionModelImpl(
      {required this.id,
      @JsonKey(name: 'habitat_id') required this.habitatId,
      @JsonKey(name: 'owner_id') required this.ownerId,
      @JsonKey(name: 'created_at') required this.createdAt,
      final List<HUReactionModel> reactions = const [],
      required this.goal})
      : _reactions = reactions;

  factory _$HUActionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HUActionModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'habitat_id')
  final int habitatId;
  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final List<HUReactionModel> _reactions;
  @override
  @JsonKey()
  List<HUReactionModel> get reactions {
    if (_reactions is EqualUnmodifiableListView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reactions);
  }

  @override
  final HUGoalModel goal;

  @override
  String toString() {
    return 'HUActionModel(id: $id, habitatId: $habitatId, ownerId: $ownerId, createdAt: $createdAt, reactions: $reactions, goal: $goal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HUActionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.habitatId, habitatId) ||
                other.habitatId == habitatId) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._reactions, _reactions) &&
            (identical(other.goal, goal) || other.goal == goal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, habitatId, ownerId,
      createdAt, const DeepCollectionEquality().hash(_reactions), goal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HUActionModelImplCopyWith<_$HUActionModelImpl> get copyWith =>
      __$$HUActionModelImplCopyWithImpl<_$HUActionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HUActionModelImplToJson(
      this,
    );
  }
}

abstract class _HUActionModel implements HUActionModel {
  factory _HUActionModel(
      {required final int id,
      @JsonKey(name: 'habitat_id') required final int habitatId,
      @JsonKey(name: 'owner_id') required final String ownerId,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      final List<HUReactionModel> reactions,
      required final HUGoalModel goal}) = _$HUActionModelImpl;

  factory _HUActionModel.fromJson(Map<String, dynamic> json) =
      _$HUActionModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'habitat_id')
  int get habitatId;
  @override
  @JsonKey(name: 'owner_id')
  String get ownerId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  List<HUReactionModel> get reactions;
  @override
  HUGoalModel get goal;
  @override
  @JsonKey(ignore: true)
  _$$HUActionModelImplCopyWith<_$HUActionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
