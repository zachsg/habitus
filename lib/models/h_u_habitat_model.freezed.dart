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
  HUGoalModel get goal => throw _privateConstructorUsedError;
  List<String> get admins => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_open')
  bool get isOpen => throw _privateConstructorUsedError;

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
      HUGoalModel goal,
      List<String> admins,
      List<String> members,
      @JsonKey(name: 'is_open') bool isOpen});

  $HUGoalModelCopyWith<$Res> get goal;
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
    Object? goal = null,
    Object? admins = null,
    Object? members = null,
    Object? isOpen = null,
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
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as HUGoalModel,
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
abstract class _$$_HUHabitatModelCopyWith<$Res>
    implements $HUHabitatModelCopyWith<$Res> {
  factory _$$_HUHabitatModelCopyWith(
          _$_HUHabitatModel value, $Res Function(_$_HUHabitatModel) then) =
      __$$_HUHabitatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'creator_id') String creatorId,
      String name,
      String header,
      HUGoalModel goal,
      List<String> admins,
      List<String> members,
      @JsonKey(name: 'is_open') bool isOpen});

  @override
  $HUGoalModelCopyWith<$Res> get goal;
}

/// @nodoc
class __$$_HUHabitatModelCopyWithImpl<$Res>
    extends _$HUHabitatModelCopyWithImpl<$Res, _$_HUHabitatModel>
    implements _$$_HUHabitatModelCopyWith<$Res> {
  __$$_HUHabitatModelCopyWithImpl(
      _$_HUHabitatModel _value, $Res Function(_$_HUHabitatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updatedAt = null,
    Object? creatorId = null,
    Object? name = null,
    Object? header = null,
    Object? goal = null,
    Object? admins = null,
    Object? members = null,
    Object? isOpen = null,
  }) {
    return _then(_$_HUHabitatModel(
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
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as HUGoalModel,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HUHabitatModel implements _HUHabitatModel {
  _$_HUHabitatModel(
      {required this.id,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'creator_id') required this.creatorId,
      this.name = '',
      this.header = '',
      required this.goal,
      final List<String> admins = const [],
      final List<String> members = const [],
      @JsonKey(name: 'is_open') this.isOpen = true})
      : _admins = admins,
        _members = members;

  factory _$_HUHabitatModel.fromJson(Map<String, dynamic> json) =>
      _$$_HUHabitatModelFromJson(json);

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
  final HUGoalModel goal;
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
  String toString() {
    return 'HUHabitatModel(id: $id, updatedAt: $updatedAt, creatorId: $creatorId, name: $name, header: $header, goal: $goal, admins: $admins, members: $members, isOpen: $isOpen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HUHabitatModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            const DeepCollectionEquality().equals(other._admins, _admins) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
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
      goal,
      const DeepCollectionEquality().hash(_admins),
      const DeepCollectionEquality().hash(_members),
      isOpen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HUHabitatModelCopyWith<_$_HUHabitatModel> get copyWith =>
      __$$_HUHabitatModelCopyWithImpl<_$_HUHabitatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HUHabitatModelToJson(
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
      required final HUGoalModel goal,
      final List<String> admins,
      final List<String> members,
      @JsonKey(name: 'is_open') final bool isOpen}) = _$_HUHabitatModel;

  factory _HUHabitatModel.fromJson(Map<String, dynamic> json) =
      _$_HUHabitatModel.fromJson;

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
  HUGoalModel get goal;
  @override
  List<String> get admins;
  @override
  List<String> get members;
  @override
  @JsonKey(name: 'is_open')
  bool get isOpen;
  @override
  @JsonKey(ignore: true)
  _$$_HUHabitatModelCopyWith<_$_HUHabitatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
