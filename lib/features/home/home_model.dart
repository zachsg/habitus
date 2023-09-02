import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/xmodels.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
class HomeModel with _$HomeModel {
  factory HomeModel({
    required List<HUTeamModel> teams,
    @Default(false) bool loading,
    String? error,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, Object?> json) =>
      _$HomeModelFromJson(json);
}
