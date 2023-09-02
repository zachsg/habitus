// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_nav_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BottomNavModel _$BottomNavModelFromJson(Map<String, dynamic> json) {
  return _BottomNavModel.fromJson(json);
}

/// @nodoc
mixin _$BottomNavModel {
  int get index => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BottomNavModelCopyWith<BottomNavModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavModelCopyWith<$Res> {
  factory $BottomNavModelCopyWith(
          BottomNavModel value, $Res Function(BottomNavModel) then) =
      _$BottomNavModelCopyWithImpl<$Res, BottomNavModel>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$BottomNavModelCopyWithImpl<$Res, $Val extends BottomNavModel>
    implements $BottomNavModelCopyWith<$Res> {
  _$BottomNavModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BottomNavModelCopyWith<$Res>
    implements $BottomNavModelCopyWith<$Res> {
  factory _$$_BottomNavModelCopyWith(
          _$_BottomNavModel value, $Res Function(_$_BottomNavModel) then) =
      __$$_BottomNavModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_BottomNavModelCopyWithImpl<$Res>
    extends _$BottomNavModelCopyWithImpl<$Res, _$_BottomNavModel>
    implements _$$_BottomNavModelCopyWith<$Res> {
  __$$_BottomNavModelCopyWithImpl(
      _$_BottomNavModel _value, $Res Function(_$_BottomNavModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_BottomNavModel(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BottomNavModel implements _BottomNavModel {
  _$_BottomNavModel({this.index = 1});

  factory _$_BottomNavModel.fromJson(Map<String, dynamic> json) =>
      _$$_BottomNavModelFromJson(json);

  @override
  @JsonKey()
  final int index;

  @override
  String toString() {
    return 'BottomNavModel(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BottomNavModel &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BottomNavModelCopyWith<_$_BottomNavModel> get copyWith =>
      __$$_BottomNavModelCopyWithImpl<_$_BottomNavModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BottomNavModelToJson(
      this,
    );
  }
}

abstract class _BottomNavModel implements BottomNavModel {
  factory _BottomNavModel({final int index}) = _$_BottomNavModel;

  factory _BottomNavModel.fromJson(Map<String, dynamic> json) =
      _$_BottomNavModel.fromJson;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_BottomNavModelCopyWith<_$_BottomNavModel> get copyWith =>
      throw _privateConstructorUsedError;
}
