// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'h_u_callout_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HUCalloutModel _$HUCalloutModelFromJson(Map<String, dynamic> json) {
  return _HUCalloutModel.fromJson(json);
}

/// @nodoc
mixin _$HUCalloutModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'habitat_id')
  int get habitatId => throw _privateConstructorUsedError;
  String get caller => throw _privateConstructorUsedError;
  String get callee => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HUCalloutModelCopyWith<HUCalloutModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HUCalloutModelCopyWith<$Res> {
  factory $HUCalloutModelCopyWith(
          HUCalloutModel value, $Res Function(HUCalloutModel) then) =
      _$HUCalloutModelCopyWithImpl<$Res, HUCalloutModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'habitat_id') int habitatId,
      String caller,
      String callee,
      bool done});
}

/// @nodoc
class _$HUCalloutModelCopyWithImpl<$Res, $Val extends HUCalloutModel>
    implements $HUCalloutModelCopyWith<$Res> {
  _$HUCalloutModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? habitatId = null,
    Object? caller = null,
    Object? callee = null,
    Object? done = null,
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
      habitatId: null == habitatId
          ? _value.habitatId
          : habitatId // ignore: cast_nullable_to_non_nullable
              as int,
      caller: null == caller
          ? _value.caller
          : caller // ignore: cast_nullable_to_non_nullable
              as String,
      callee: null == callee
          ? _value.callee
          : callee // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HUCalloutModelImplCopyWith<$Res>
    implements $HUCalloutModelCopyWith<$Res> {
  factory _$$HUCalloutModelImplCopyWith(_$HUCalloutModelImpl value,
          $Res Function(_$HUCalloutModelImpl) then) =
      __$$HUCalloutModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'habitat_id') int habitatId,
      String caller,
      String callee,
      bool done});
}

/// @nodoc
class __$$HUCalloutModelImplCopyWithImpl<$Res>
    extends _$HUCalloutModelCopyWithImpl<$Res, _$HUCalloutModelImpl>
    implements _$$HUCalloutModelImplCopyWith<$Res> {
  __$$HUCalloutModelImplCopyWithImpl(
      _$HUCalloutModelImpl _value, $Res Function(_$HUCalloutModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? habitatId = null,
    Object? caller = null,
    Object? callee = null,
    Object? done = null,
  }) {
    return _then(_$HUCalloutModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      habitatId: null == habitatId
          ? _value.habitatId
          : habitatId // ignore: cast_nullable_to_non_nullable
              as int,
      caller: null == caller
          ? _value.caller
          : caller // ignore: cast_nullable_to_non_nullable
              as String,
      callee: null == callee
          ? _value.callee
          : callee // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HUCalloutModelImpl implements _HUCalloutModel {
  _$HUCalloutModelImpl(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'habitat_id') required this.habitatId,
      required this.caller,
      required this.callee,
      this.done = false});

  factory _$HUCalloutModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HUCalloutModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'habitat_id')
  final int habitatId;
  @override
  final String caller;
  @override
  final String callee;
  @override
  @JsonKey()
  final bool done;

  @override
  String toString() {
    return 'HUCalloutModel(id: $id, createdAt: $createdAt, habitatId: $habitatId, caller: $caller, callee: $callee, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HUCalloutModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.habitatId, habitatId) ||
                other.habitatId == habitatId) &&
            (identical(other.caller, caller) || other.caller == caller) &&
            (identical(other.callee, callee) || other.callee == callee) &&
            (identical(other.done, done) || other.done == done));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, habitatId, caller, callee, done);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HUCalloutModelImplCopyWith<_$HUCalloutModelImpl> get copyWith =>
      __$$HUCalloutModelImplCopyWithImpl<_$HUCalloutModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HUCalloutModelImplToJson(
      this,
    );
  }
}

abstract class _HUCalloutModel implements HUCalloutModel {
  factory _HUCalloutModel(
      {required final int id,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'habitat_id') required final int habitatId,
      required final String caller,
      required final String callee,
      final bool done}) = _$HUCalloutModelImpl;

  factory _HUCalloutModel.fromJson(Map<String, dynamic> json) =
      _$HUCalloutModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'habitat_id')
  int get habitatId;
  @override
  String get caller;
  @override
  String get callee;
  @override
  bool get done;
  @override
  @JsonKey(ignore: true)
  _$$HUCalloutModelImplCopyWith<_$HUCalloutModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
