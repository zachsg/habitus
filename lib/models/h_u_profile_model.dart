import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habitus/models/xmodels.dart';

part 'h_u_profile_model.freezed.dart';
part 'h_u_profile_model.g.dart';

@freezed
class HUProfileModel with _$HUProfileModel {
  factory HUProfileModel({
    required String id,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @Default('') String name,
    @Default('') String email,
    @Default('') String handle,
    @Default('') String bio,
    @Default('') String avatar,
    @Default([]) List<int> badges,
    @Default([]) List<HUGoalModel> goals,
    @Default([]) List<String> habinauts,
    @Default(false) @JsonKey(name: 'is_pro') bool isPro,
    @Default(false) @JsonKey(name: 'accepted_terms') bool acceptedTerms,
  }) = _HUProfileModel;

  factory HUProfileModel.fromJson(Map<String, Object?> json) =>
      _$HUProfileModelFromJson(json);
}
