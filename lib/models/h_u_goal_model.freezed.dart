// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'h_u_goal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HUGoalModel _$HUGoalModelFromJson(Map<String, dynamic> json) {
  return _HUGoalModel.fromJson(json);
}

/// @nodoc
mixin _$HUGoalModel {
  @JsonKey(name: 'habitat_id')
  int get habitatId => throw _privateConstructorUsedError;
  String get habit => throw _privateConstructorUsedError;
  Unit get unit => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HUGoalModelCopyWith<HUGoalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HUGoalModelCopyWith<$Res> {
  factory $HUGoalModelCopyWith(
          HUGoalModel value, $Res Function(HUGoalModel) then) =
      _$HUGoalModelCopyWithImpl<$Res, HUGoalModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'habitat_id') int habitatId,
      String habit,
      Unit unit,
      int value});
}

/// @nodoc
class _$HUGoalModelCopyWithImpl<$Res, $Val extends HUGoalModel>
    implements $HUGoalModelCopyWith<$Res> {
  _$HUGoalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitatId = null,
    Object? habit = null,
    Object? unit = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      habitatId: null == habitatId
          ? _value.habitatId
          : habitatId // ignore: cast_nullable_to_non_nullable
              as int,
      habit: null == habit
          ? _value.habit
          : habit // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_HUGoalModelCopyWith<$Res>
    implements $HUGoalModelCopyWith<$Res> {
  factory _$$_HUGoalModelCopyWith(
          _$_HUGoalModel value, $Res Function(_$_HUGoalModel) then) =
      __$$_HUGoalModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'habitat_id') int habitatId,
      String habit,
      Unit unit,
      int value});
}

/// @nodoc
class __$$_HUGoalModelCopyWithImpl<$Res>
    extends _$HUGoalModelCopyWithImpl<$Res, _$_HUGoalModel>
    implements _$$_HUGoalModelCopyWith<$Res> {
  __$$_HUGoalModelCopyWithImpl(
      _$_HUGoalModel _value, $Res Function(_$_HUGoalModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitatId = null,
    Object? habit = null,
    Object? unit = null,
    Object? value = null,
  }) {
    return _then(_$_HUGoalModel(
      habitatId: null == habitatId
          ? _value.habitatId
          : habitatId // ignore: cast_nullable_to_non_nullable
              as int,
      habit: null == habit
          ? _value.habit
          : habit // ignore: cast_nullable_to_non_nullable
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
class _$_HUGoalModel implements _HUGoalModel {
  _$_HUGoalModel(
      {@JsonKey(name: 'habitat_id') required this.habitatId,
      required this.habit,
      required this.unit,
      required this.value});

  factory _$_HUGoalModel.fromJson(Map<String, dynamic> json) =>
      _$$_HUGoalModelFromJson(json);

  @override
  @JsonKey(name: 'habitat_id')
  final int habitatId;
  @override
  final String habit;
  @override
  final Unit unit;
  @override
  final int value;

  @override
  String toString() {
    return 'HUGoalModel(habitatId: $habitatId, habit: $habit, unit: $unit, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HUGoalModel &&
            (identical(other.habitatId, habitatId) ||
                other.habitatId == habitatId) &&
            (identical(other.habit, habit) || other.habit == habit) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, habitatId, habit, unit, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HUGoalModelCopyWith<_$_HUGoalModel> get copyWith =>
      __$$_HUGoalModelCopyWithImpl<_$_HUGoalModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HUGoalModelToJson(
      this,
    );
  }
}

abstract class _HUGoalModel implements HUGoalModel {
  factory _HUGoalModel(
      {@JsonKey(name: 'habitat_id') required final int habitatId,
      required final String habit,
      required final Unit unit,
      required final int value}) = _$_HUGoalModel;

  factory _HUGoalModel.fromJson(Map<String, dynamic> json) =
      _$_HUGoalModel.fromJson;

  @override
  @JsonKey(name: 'habitat_id')
  int get habitatId;
  @override
  String get habit;
  @override
  Unit get unit;
  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_HUGoalModelCopyWith<_$_HUGoalModel> get copyWith =>
      throw _privateConstructorUsedError;
}
