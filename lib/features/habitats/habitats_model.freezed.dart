// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habitats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HabitatsModel _$HabitatsModelFromJson(Map<String, dynamic> json) {
  return _HabitatsModel.fromJson(json);
}

/// @nodoc
mixin _$HabitatsModel {
  List<HUHabitatModel> get habitats => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HabitatsModelCopyWith<HabitatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitatsModelCopyWith<$Res> {
  factory $HabitatsModelCopyWith(
          HabitatsModel value, $Res Function(HabitatsModel) then) =
      _$HabitatsModelCopyWithImpl<$Res, HabitatsModel>;
  @useResult
  $Res call({List<HUHabitatModel> habitats, bool loading, String? error});
}

/// @nodoc
class _$HabitatsModelCopyWithImpl<$Res, $Val extends HabitatsModel>
    implements $HabitatsModelCopyWith<$Res> {
  _$HabitatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitats = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      habitats: null == habitats
          ? _value.habitats
          : habitats // ignore: cast_nullable_to_non_nullable
              as List<HUHabitatModel>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HabitatsModelCopyWith<$Res>
    implements $HabitatsModelCopyWith<$Res> {
  factory _$$_HabitatsModelCopyWith(
          _$_HabitatsModel value, $Res Function(_$_HabitatsModel) then) =
      __$$_HabitatsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<HUHabitatModel> habitats, bool loading, String? error});
}

/// @nodoc
class __$$_HabitatsModelCopyWithImpl<$Res>
    extends _$HabitatsModelCopyWithImpl<$Res, _$_HabitatsModel>
    implements _$$_HabitatsModelCopyWith<$Res> {
  __$$_HabitatsModelCopyWithImpl(
      _$_HabitatsModel _value, $Res Function(_$_HabitatsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitats = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_$_HabitatsModel(
      habitats: null == habitats
          ? _value._habitats
          : habitats // ignore: cast_nullable_to_non_nullable
              as List<HUHabitatModel>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HabitatsModel implements _HabitatsModel {
  _$_HabitatsModel(
      {required final List<HUHabitatModel> habitats,
      this.loading = false,
      this.error})
      : _habitats = habitats;

  factory _$_HabitatsModel.fromJson(Map<String, dynamic> json) =>
      _$$_HabitatsModelFromJson(json);

  final List<HUHabitatModel> _habitats;
  @override
  List<HUHabitatModel> get habitats {
    if (_habitats is EqualUnmodifiableListView) return _habitats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habitats);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;

  @override
  String toString() {
    return 'HabitatsModel(habitats: $habitats, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HabitatsModel &&
            const DeepCollectionEquality().equals(other._habitats, _habitats) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_habitats), loading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HabitatsModelCopyWith<_$_HabitatsModel> get copyWith =>
      __$$_HabitatsModelCopyWithImpl<_$_HabitatsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HabitatsModelToJson(
      this,
    );
  }
}

abstract class _HabitatsModel implements HabitatsModel {
  factory _HabitatsModel(
      {required final List<HUHabitatModel> habitats,
      final bool loading,
      final String? error}) = _$_HabitatsModel;

  factory _HabitatsModel.fromJson(Map<String, dynamic> json) =
      _$_HabitatsModel.fromJson;

  @override
  List<HUHabitatModel> get habitats;
  @override
  bool get loading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_HabitatsModelCopyWith<_$_HabitatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
