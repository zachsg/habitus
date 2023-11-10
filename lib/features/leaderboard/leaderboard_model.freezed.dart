// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LeaderboardModel _$LeaderboardModelFromJson(Map<String, dynamic> json) {
  return _LeaderboardModel.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardModel {
  HUHabitatModel get habitat => throw _privateConstructorUsedError;
  List<HUHabitatModel> get habitats => throw _privateConstructorUsedError;
  List<HUProfileModel> get profiles => throw _privateConstructorUsedError;
  List<HUCreditModel> get credits => throw _privateConstructorUsedError;
  HabitType get habitType => throw _privateConstructorUsedError;
  bool get byCredit => throw _privateConstructorUsedError;
  bool get byHabitat => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaderboardModelCopyWith<LeaderboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardModelCopyWith<$Res> {
  factory $LeaderboardModelCopyWith(
          LeaderboardModel value, $Res Function(LeaderboardModel) then) =
      _$LeaderboardModelCopyWithImpl<$Res, LeaderboardModel>;
  @useResult
  $Res call(
      {HUHabitatModel habitat,
      List<HUHabitatModel> habitats,
      List<HUProfileModel> profiles,
      List<HUCreditModel> credits,
      HabitType habitType,
      bool byCredit,
      bool byHabitat,
      bool loading,
      String? error});

  $HUHabitatModelCopyWith<$Res> get habitat;
}

/// @nodoc
class _$LeaderboardModelCopyWithImpl<$Res, $Val extends LeaderboardModel>
    implements $LeaderboardModelCopyWith<$Res> {
  _$LeaderboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitat = null,
    Object? habitats = null,
    Object? profiles = null,
    Object? credits = null,
    Object? habitType = null,
    Object? byCredit = null,
    Object? byHabitat = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      habitat: null == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as HUHabitatModel,
      habitats: null == habitats
          ? _value.habitats
          : habitats // ignore: cast_nullable_to_non_nullable
              as List<HUHabitatModel>,
      profiles: null == profiles
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<HUProfileModel>,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as List<HUCreditModel>,
      habitType: null == habitType
          ? _value.habitType
          : habitType // ignore: cast_nullable_to_non_nullable
              as HabitType,
      byCredit: null == byCredit
          ? _value.byCredit
          : byCredit // ignore: cast_nullable_to_non_nullable
              as bool,
      byHabitat: null == byHabitat
          ? _value.byHabitat
          : byHabitat // ignore: cast_nullable_to_non_nullable
              as bool,
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

  @override
  @pragma('vm:prefer-inline')
  $HUHabitatModelCopyWith<$Res> get habitat {
    return $HUHabitatModelCopyWith<$Res>(_value.habitat, (value) {
      return _then(_value.copyWith(habitat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeaderboardModelImplCopyWith<$Res>
    implements $LeaderboardModelCopyWith<$Res> {
  factory _$$LeaderboardModelImplCopyWith(_$LeaderboardModelImpl value,
          $Res Function(_$LeaderboardModelImpl) then) =
      __$$LeaderboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HUHabitatModel habitat,
      List<HUHabitatModel> habitats,
      List<HUProfileModel> profiles,
      List<HUCreditModel> credits,
      HabitType habitType,
      bool byCredit,
      bool byHabitat,
      bool loading,
      String? error});

  @override
  $HUHabitatModelCopyWith<$Res> get habitat;
}

/// @nodoc
class __$$LeaderboardModelImplCopyWithImpl<$Res>
    extends _$LeaderboardModelCopyWithImpl<$Res, _$LeaderboardModelImpl>
    implements _$$LeaderboardModelImplCopyWith<$Res> {
  __$$LeaderboardModelImplCopyWithImpl(_$LeaderboardModelImpl _value,
      $Res Function(_$LeaderboardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habitat = null,
    Object? habitats = null,
    Object? profiles = null,
    Object? credits = null,
    Object? habitType = null,
    Object? byCredit = null,
    Object? byHabitat = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_$LeaderboardModelImpl(
      habitat: null == habitat
          ? _value.habitat
          : habitat // ignore: cast_nullable_to_non_nullable
              as HUHabitatModel,
      habitats: null == habitats
          ? _value._habitats
          : habitats // ignore: cast_nullable_to_non_nullable
              as List<HUHabitatModel>,
      profiles: null == profiles
          ? _value._profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<HUProfileModel>,
      credits: null == credits
          ? _value._credits
          : credits // ignore: cast_nullable_to_non_nullable
              as List<HUCreditModel>,
      habitType: null == habitType
          ? _value.habitType
          : habitType // ignore: cast_nullable_to_non_nullable
              as HabitType,
      byCredit: null == byCredit
          ? _value.byCredit
          : byCredit // ignore: cast_nullable_to_non_nullable
              as bool,
      byHabitat: null == byHabitat
          ? _value.byHabitat
          : byHabitat // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$LeaderboardModelImpl implements _LeaderboardModel {
  _$LeaderboardModelImpl(
      {required this.habitat,
      final List<HUHabitatModel> habitats = const [],
      final List<HUProfileModel> profiles = const [],
      final List<HUCreditModel> credits = const [],
      this.habitType = HabitType.read,
      this.byCredit = true,
      this.byHabitat = true,
      this.loading = false,
      this.error})
      : _habitats = habitats,
        _profiles = profiles,
        _credits = credits;

  factory _$LeaderboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaderboardModelImplFromJson(json);

  @override
  final HUHabitatModel habitat;
  final List<HUHabitatModel> _habitats;
  @override
  @JsonKey()
  List<HUHabitatModel> get habitats {
    if (_habitats is EqualUnmodifiableListView) return _habitats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habitats);
  }

  final List<HUProfileModel> _profiles;
  @override
  @JsonKey()
  List<HUProfileModel> get profiles {
    if (_profiles is EqualUnmodifiableListView) return _profiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }

  final List<HUCreditModel> _credits;
  @override
  @JsonKey()
  List<HUCreditModel> get credits {
    if (_credits is EqualUnmodifiableListView) return _credits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_credits);
  }

  @override
  @JsonKey()
  final HabitType habitType;
  @override
  @JsonKey()
  final bool byCredit;
  @override
  @JsonKey()
  final bool byHabitat;
  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;

  @override
  String toString() {
    return 'LeaderboardModel(habitat: $habitat, habitats: $habitats, profiles: $profiles, credits: $credits, habitType: $habitType, byCredit: $byCredit, byHabitat: $byHabitat, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardModelImpl &&
            (identical(other.habitat, habitat) || other.habitat == habitat) &&
            const DeepCollectionEquality().equals(other._habitats, _habitats) &&
            const DeepCollectionEquality().equals(other._profiles, _profiles) &&
            const DeepCollectionEquality().equals(other._credits, _credits) &&
            (identical(other.habitType, habitType) ||
                other.habitType == habitType) &&
            (identical(other.byCredit, byCredit) ||
                other.byCredit == byCredit) &&
            (identical(other.byHabitat, byHabitat) ||
                other.byHabitat == byHabitat) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      habitat,
      const DeepCollectionEquality().hash(_habitats),
      const DeepCollectionEquality().hash(_profiles),
      const DeepCollectionEquality().hash(_credits),
      habitType,
      byCredit,
      byHabitat,
      loading,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardModelImplCopyWith<_$LeaderboardModelImpl> get copyWith =>
      __$$LeaderboardModelImplCopyWithImpl<_$LeaderboardModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaderboardModelImplToJson(
      this,
    );
  }
}

abstract class _LeaderboardModel implements LeaderboardModel {
  factory _LeaderboardModel(
      {required final HUHabitatModel habitat,
      final List<HUHabitatModel> habitats,
      final List<HUProfileModel> profiles,
      final List<HUCreditModel> credits,
      final HabitType habitType,
      final bool byCredit,
      final bool byHabitat,
      final bool loading,
      final String? error}) = _$LeaderboardModelImpl;

  factory _LeaderboardModel.fromJson(Map<String, dynamic> json) =
      _$LeaderboardModelImpl.fromJson;

  @override
  HUHabitatModel get habitat;
  @override
  List<HUHabitatModel> get habitats;
  @override
  List<HUProfileModel> get profiles;
  @override
  List<HUCreditModel> get credits;
  @override
  HabitType get habitType;
  @override
  bool get byCredit;
  @override
  bool get byHabitat;
  @override
  bool get loading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$LeaderboardModelImplCopyWith<_$LeaderboardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
