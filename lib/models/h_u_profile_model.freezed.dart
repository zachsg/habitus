// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'h_u_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HUProfileModel _$HUProfileModelFromJson(Map<String, dynamic> json) {
  return _HUProfileModel.fromJson(json);
}

/// @nodoc
mixin _$HUProfileModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get handle => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  List<int> get badges => throw _privateConstructorUsedError;
  List<HUGoalModel> get goals => throw _privateConstructorUsedError;
  List<String> get habinauts => throw _privateConstructorUsedError;
  @JsonKey(name: 'push_token')
  String get pushToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_pro')
  bool get isPro => throw _privateConstructorUsedError;
  @JsonKey(name: 'accepted_terms')
  bool get acceptedTerms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HUProfileModelCopyWith<HUProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HUProfileModelCopyWith<$Res> {
  factory $HUProfileModelCopyWith(
          HUProfileModel value, $Res Function(HUProfileModel) then) =
      _$HUProfileModelCopyWithImpl<$Res, HUProfileModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String name,
      String email,
      String handle,
      String bio,
      String avatar,
      List<int> badges,
      List<HUGoalModel> goals,
      List<String> habinauts,
      @JsonKey(name: 'push_token') String pushToken,
      @JsonKey(name: 'is_pro') bool isPro,
      @JsonKey(name: 'accepted_terms') bool acceptedTerms});
}

/// @nodoc
class _$HUProfileModelCopyWithImpl<$Res, $Val extends HUProfileModel>
    implements $HUProfileModelCopyWith<$Res> {
  _$HUProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updatedAt = null,
    Object? name = null,
    Object? email = null,
    Object? handle = null,
    Object? bio = null,
    Object? avatar = null,
    Object? badges = null,
    Object? goals = null,
    Object? habinauts = null,
    Object? pushToken = null,
    Object? isPro = null,
    Object? acceptedTerms = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      handle: null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      badges: null == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<int>,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<HUGoalModel>,
      habinauts: null == habinauts
          ? _value.habinauts
          : habinauts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pushToken: null == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String,
      isPro: null == isPro
          ? _value.isPro
          : isPro // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptedTerms: null == acceptedTerms
          ? _value.acceptedTerms
          : acceptedTerms // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HUProfileModelImplCopyWith<$Res>
    implements $HUProfileModelCopyWith<$Res> {
  factory _$$HUProfileModelImplCopyWith(_$HUProfileModelImpl value,
          $Res Function(_$HUProfileModelImpl) then) =
      __$$HUProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String name,
      String email,
      String handle,
      String bio,
      String avatar,
      List<int> badges,
      List<HUGoalModel> goals,
      List<String> habinauts,
      @JsonKey(name: 'push_token') String pushToken,
      @JsonKey(name: 'is_pro') bool isPro,
      @JsonKey(name: 'accepted_terms') bool acceptedTerms});
}

/// @nodoc
class __$$HUProfileModelImplCopyWithImpl<$Res>
    extends _$HUProfileModelCopyWithImpl<$Res, _$HUProfileModelImpl>
    implements _$$HUProfileModelImplCopyWith<$Res> {
  __$$HUProfileModelImplCopyWithImpl(
      _$HUProfileModelImpl _value, $Res Function(_$HUProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updatedAt = null,
    Object? name = null,
    Object? email = null,
    Object? handle = null,
    Object? bio = null,
    Object? avatar = null,
    Object? badges = null,
    Object? goals = null,
    Object? habinauts = null,
    Object? pushToken = null,
    Object? isPro = null,
    Object? acceptedTerms = null,
  }) {
    return _then(_$HUProfileModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      handle: null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      badges: null == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<int>,
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<HUGoalModel>,
      habinauts: null == habinauts
          ? _value._habinauts
          : habinauts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pushToken: null == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String,
      isPro: null == isPro
          ? _value.isPro
          : isPro // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptedTerms: null == acceptedTerms
          ? _value.acceptedTerms
          : acceptedTerms // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HUProfileModelImpl implements _HUProfileModel {
  _$HUProfileModelImpl(
      {required this.id,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.name = '',
      this.email = '',
      this.handle = '',
      this.bio = '',
      this.avatar = '',
      final List<int> badges = const [],
      final List<HUGoalModel> goals = const [],
      final List<String> habinauts = const [],
      @JsonKey(name: 'push_token') this.pushToken = '',
      @JsonKey(name: 'is_pro') this.isPro = false,
      @JsonKey(name: 'accepted_terms') this.acceptedTerms = false})
      : _badges = badges,
        _goals = goals,
        _habinauts = habinauts;

  factory _$HUProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HUProfileModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String handle;
  @override
  @JsonKey()
  final String bio;
  @override
  @JsonKey()
  final String avatar;
  final List<int> _badges;
  @override
  @JsonKey()
  List<int> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  final List<HUGoalModel> _goals;
  @override
  @JsonKey()
  List<HUGoalModel> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  final List<String> _habinauts;
  @override
  @JsonKey()
  List<String> get habinauts {
    if (_habinauts is EqualUnmodifiableListView) return _habinauts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habinauts);
  }

  @override
  @JsonKey(name: 'push_token')
  final String pushToken;
  @override
  @JsonKey(name: 'is_pro')
  final bool isPro;
  @override
  @JsonKey(name: 'accepted_terms')
  final bool acceptedTerms;

  @override
  String toString() {
    return 'HUProfileModel(id: $id, updatedAt: $updatedAt, name: $name, email: $email, handle: $handle, bio: $bio, avatar: $avatar, badges: $badges, goals: $goals, habinauts: $habinauts, pushToken: $pushToken, isPro: $isPro, acceptedTerms: $acceptedTerms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HUProfileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.handle, handle) || other.handle == handle) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            const DeepCollectionEquality()
                .equals(other._habinauts, _habinauts) &&
            (identical(other.pushToken, pushToken) ||
                other.pushToken == pushToken) &&
            (identical(other.isPro, isPro) || other.isPro == isPro) &&
            (identical(other.acceptedTerms, acceptedTerms) ||
                other.acceptedTerms == acceptedTerms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      updatedAt,
      name,
      email,
      handle,
      bio,
      avatar,
      const DeepCollectionEquality().hash(_badges),
      const DeepCollectionEquality().hash(_goals),
      const DeepCollectionEquality().hash(_habinauts),
      pushToken,
      isPro,
      acceptedTerms);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HUProfileModelImplCopyWith<_$HUProfileModelImpl> get copyWith =>
      __$$HUProfileModelImplCopyWithImpl<_$HUProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HUProfileModelImplToJson(
      this,
    );
  }
}

abstract class _HUProfileModel implements HUProfileModel {
  factory _HUProfileModel(
          {required final String id,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          final String name,
          final String email,
          final String handle,
          final String bio,
          final String avatar,
          final List<int> badges,
          final List<HUGoalModel> goals,
          final List<String> habinauts,
          @JsonKey(name: 'push_token') final String pushToken,
          @JsonKey(name: 'is_pro') final bool isPro,
          @JsonKey(name: 'accepted_terms') final bool acceptedTerms}) =
      _$HUProfileModelImpl;

  factory _HUProfileModel.fromJson(Map<String, dynamic> json) =
      _$HUProfileModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  String get name;
  @override
  String get email;
  @override
  String get handle;
  @override
  String get bio;
  @override
  String get avatar;
  @override
  List<int> get badges;
  @override
  List<HUGoalModel> get goals;
  @override
  List<String> get habinauts;
  @override
  @JsonKey(name: 'push_token')
  String get pushToken;
  @override
  @JsonKey(name: 'is_pro')
  bool get isPro;
  @override
  @JsonKey(name: 'accepted_terms')
  bool get acceptedTerms;
  @override
  @JsonKey(ignore: true)
  _$$HUProfileModelImplCopyWith<_$HUProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
