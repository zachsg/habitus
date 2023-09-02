// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JoinTeamModel _$JoinTeamModelFromJson(Map<String, dynamic> json) {
  return _JoinTeamModel.fromJson(json);
}

/// @nodoc
mixin _$JoinTeamModel {
  HUTeamModel get team => throw _privateConstructorUsedError;
  List<HUTeamModel> get teams => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JoinTeamModelCopyWith<JoinTeamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinTeamModelCopyWith<$Res> {
  factory $JoinTeamModelCopyWith(
          JoinTeamModel value, $Res Function(JoinTeamModel) then) =
      _$JoinTeamModelCopyWithImpl<$Res, JoinTeamModel>;
  @useResult
  $Res call(
      {HUTeamModel team, List<HUTeamModel> teams, bool loading, String? error});

  $HUTeamModelCopyWith<$Res> get team;
}

/// @nodoc
class _$JoinTeamModelCopyWithImpl<$Res, $Val extends JoinTeamModel>
    implements $JoinTeamModelCopyWith<$Res> {
  _$JoinTeamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = null,
    Object? teams = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as HUTeamModel,
      teams: null == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<HUTeamModel>,
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
  $HUTeamModelCopyWith<$Res> get team {
    return $HUTeamModelCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_JoinTeamModelCopyWith<$Res>
    implements $JoinTeamModelCopyWith<$Res> {
  factory _$$_JoinTeamModelCopyWith(
          _$_JoinTeamModel value, $Res Function(_$_JoinTeamModel) then) =
      __$$_JoinTeamModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HUTeamModel team, List<HUTeamModel> teams, bool loading, String? error});

  @override
  $HUTeamModelCopyWith<$Res> get team;
}

/// @nodoc
class __$$_JoinTeamModelCopyWithImpl<$Res>
    extends _$JoinTeamModelCopyWithImpl<$Res, _$_JoinTeamModel>
    implements _$$_JoinTeamModelCopyWith<$Res> {
  __$$_JoinTeamModelCopyWithImpl(
      _$_JoinTeamModel _value, $Res Function(_$_JoinTeamModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = null,
    Object? teams = null,
    Object? loading = null,
    Object? error = freezed,
  }) {
    return _then(_$_JoinTeamModel(
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as HUTeamModel,
      teams: null == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<HUTeamModel>,
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
class _$_JoinTeamModel implements _JoinTeamModel {
  _$_JoinTeamModel(
      {required this.team,
      required final List<HUTeamModel> teams,
      this.loading = false,
      this.error})
      : _teams = teams;

  factory _$_JoinTeamModel.fromJson(Map<String, dynamic> json) =>
      _$$_JoinTeamModelFromJson(json);

  @override
  final HUTeamModel team;
  final List<HUTeamModel> _teams;
  @override
  List<HUTeamModel> get teams {
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;

  @override
  String toString() {
    return 'JoinTeamModel(team: $team, teams: $teams, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JoinTeamModel &&
            (identical(other.team, team) || other.team == team) &&
            const DeepCollectionEquality().equals(other._teams, _teams) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, team,
      const DeepCollectionEquality().hash(_teams), loading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JoinTeamModelCopyWith<_$_JoinTeamModel> get copyWith =>
      __$$_JoinTeamModelCopyWithImpl<_$_JoinTeamModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JoinTeamModelToJson(
      this,
    );
  }
}

abstract class _JoinTeamModel implements JoinTeamModel {
  factory _JoinTeamModel(
      {required final HUTeamModel team,
      required final List<HUTeamModel> teams,
      final bool loading,
      final String? error}) = _$_JoinTeamModel;

  factory _JoinTeamModel.fromJson(Map<String, dynamic> json) =
      _$_JoinTeamModel.fromJson;

  @override
  HUTeamModel get team;
  @override
  List<HUTeamModel> get teams;
  @override
  bool get loading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_JoinTeamModelCopyWith<_$_JoinTeamModel> get copyWith =>
      throw _privateConstructorUsedError;
}
