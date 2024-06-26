import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  factory AuthModel({
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default('') String name,
    @Default('') String handle,
    @Default(false) bool loading,
    String? error,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, Object?> json) =>
      _$AuthModelFromJson(json);
}
