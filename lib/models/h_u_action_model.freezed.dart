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
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  String get ownerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Unit get unit => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'owner_id') String ownerId,
      String name,
      Unit unit,
      int value});
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
    Object? createdAt = null,
    Object? ownerId = null,
    Object? name = null,
    Object? unit = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
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
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'owner_id') String ownerId,
      String name,
      Unit unit,
      int value});
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
    Object? createdAt = null,
    Object? ownerId = null,
    Object? name = null,
    Object? unit = null,
    Object? value = null,
  }) {
    return _then(_$_HUActionModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HUActionModel implements _HUActionModel {
  _$_HUActionModel(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'owner_id') required this.ownerId,
      required this.name,
      required this.unit,
      required this.value});

  factory _$_HUActionModel.fromJson(Map<String, dynamic> json) =>
      _$$_HUActionModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;
  @override
  final String name;
  @override
  final Unit unit;
  @override
  final int value;

  @override
  String toString() {
    return 'HUActionModel(id: $id, createdAt: $createdAt, ownerId: $ownerId, name: $name, unit: $unit, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HUActionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, ownerId, name, unit, value);

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
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'owner_id') required final String ownerId,
      required final String name,
      required final Unit unit,
      required final int value}) = _$_HUActionModel;

  factory _HUActionModel.fromJson(Map<String, dynamic> json) =
      _$_HUActionModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'owner_id')
  String get ownerId;
  @override
  String get name;
  @override
  Unit get unit;
  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_HUActionModelCopyWith<_$_HUActionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
