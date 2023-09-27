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
abstract class _$$BottomNavModelImplCopyWith<$Res>
    implements $BottomNavModelCopyWith<$Res> {
  factory _$$BottomNavModelImplCopyWith(_$BottomNavModelImpl value,
          $Res Function(_$BottomNavModelImpl) then) =
      __$$BottomNavModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$BottomNavModelImplCopyWithImpl<$Res>
    extends _$BottomNavModelCopyWithImpl<$Res, _$BottomNavModelImpl>
    implements _$$BottomNavModelImplCopyWith<$Res> {
  __$$BottomNavModelImplCopyWithImpl(
      _$BottomNavModelImpl _value, $Res Function(_$BottomNavModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$BottomNavModelImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BottomNavModelImpl implements _BottomNavModel {
  _$BottomNavModelImpl({this.index = 1});

  factory _$BottomNavModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BottomNavModelImplFromJson(json);

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
            other is _$BottomNavModelImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomNavModelImplCopyWith<_$BottomNavModelImpl> get copyWith =>
      __$$BottomNavModelImplCopyWithImpl<_$BottomNavModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BottomNavModelImplToJson(
      this,
    );
  }
}

abstract class _BottomNavModel implements BottomNavModel {
  factory _BottomNavModel({final int index}) = _$BottomNavModelImpl;

  factory _BottomNavModel.fromJson(Map<String, dynamic> json) =
      _$BottomNavModelImpl.fromJson;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$BottomNavModelImplCopyWith<_$BottomNavModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
