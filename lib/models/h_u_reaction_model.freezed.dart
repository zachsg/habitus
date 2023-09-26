// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'h_u_reaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HUReactionModel _$HUReactionModelFromJson(Map<String, dynamic> json) {
  return _HUReactionModel.fromJson(json);
}

/// @nodoc
mixin _$HUReactionModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'action_id')
  int get actionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  String get ownerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HUReactionModelCopyWith<HUReactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HUReactionModelCopyWith<$Res> {
  factory $HUReactionModelCopyWith(
          HUReactionModel value, $Res Function(HUReactionModel) then) =
      _$HUReactionModelCopyWithImpl<$Res, HUReactionModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'action_id') int actionId,
      @JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      String icon,
      String text});
}

/// @nodoc
class _$HUReactionModelCopyWithImpl<$Res, $Val extends HUReactionModel>
    implements $HUReactionModelCopyWith<$Res> {
  _$HUReactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? actionId = null,
    Object? ownerId = null,
    Object? createdAt = null,
    Object? icon = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      actionId: null == actionId
          ? _value.actionId
          : actionId // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HUReactionModelCopyWith<$Res>
    implements $HUReactionModelCopyWith<$Res> {
  factory _$$_HUReactionModelCopyWith(
          _$_HUReactionModel value, $Res Function(_$_HUReactionModel) then) =
      __$$_HUReactionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'action_id') int actionId,
      @JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      String icon,
      String text});
}

/// @nodoc
class __$$_HUReactionModelCopyWithImpl<$Res>
    extends _$HUReactionModelCopyWithImpl<$Res, _$_HUReactionModel>
    implements _$$_HUReactionModelCopyWith<$Res> {
  __$$_HUReactionModelCopyWithImpl(
      _$_HUReactionModel _value, $Res Function(_$_HUReactionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? actionId = null,
    Object? ownerId = null,
    Object? createdAt = null,
    Object? icon = null,
    Object? text = null,
  }) {
    return _then(_$_HUReactionModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      actionId: null == actionId
          ? _value.actionId
          : actionId // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HUReactionModel implements _HUReactionModel {
  _$_HUReactionModel(
      {required this.id,
      @JsonKey(name: 'action_id') required this.actionId,
      @JsonKey(name: 'owner_id') required this.ownerId,
      @JsonKey(name: 'created_at') required this.createdAt,
      this.icon = '',
      this.text = ''});

  factory _$_HUReactionModel.fromJson(Map<String, dynamic> json) =>
      _$$_HUReactionModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'action_id')
  final int actionId;
  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey()
  final String icon;
  @override
  @JsonKey()
  final String text;

  @override
  String toString() {
    return 'HUReactionModel(id: $id, actionId: $actionId, ownerId: $ownerId, createdAt: $createdAt, icon: $icon, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HUReactionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actionId, actionId) ||
                other.actionId == actionId) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, actionId, ownerId, createdAt, icon, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HUReactionModelCopyWith<_$_HUReactionModel> get copyWith =>
      __$$_HUReactionModelCopyWithImpl<_$_HUReactionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HUReactionModelToJson(
      this,
    );
  }
}

abstract class _HUReactionModel implements HUReactionModel {
  factory _HUReactionModel(
      {required final int id,
      @JsonKey(name: 'action_id') required final int actionId,
      @JsonKey(name: 'owner_id') required final String ownerId,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      final String icon,
      final String text}) = _$_HUReactionModel;

  factory _HUReactionModel.fromJson(Map<String, dynamic> json) =
      _$_HUReactionModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'action_id')
  int get actionId;
  @override
  @JsonKey(name: 'owner_id')
  String get ownerId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  String get icon;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_HUReactionModelCopyWith<_$_HUReactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
