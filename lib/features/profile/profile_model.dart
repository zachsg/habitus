import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/xmodels.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    required HUProfileModel profile,
    @Default(false) bool loading,
    String? error,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, Object?> json) =>
      _$ProfileModelFromJson(json);
}
