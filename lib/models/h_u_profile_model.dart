import 'package:freezed_annotation/freezed_annotation.dart';

part 'h_u_profile_model.freezed.dart';
part 'h_u_profile_model.g.dart';

@freezed
class HUProfileModel with _$HUProfileModel {
  factory HUProfileModel({
    required String id,
    @Default('') String name,
    @Default('') String email,
    @Default('') String handle,
    String? error,
  }) = _HUProfileModel;

  factory HUProfileModel.fromJson(Map<String, Object?> json) =>
      _$HUProfileModelFromJson(json);
}
