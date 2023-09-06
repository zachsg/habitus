import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/xmodels.dart';

part 'join_habitat_model.freezed.dart';
part 'join_habitat_model.g.dart';

@freezed
class JoinHabitatModel with _$JoinHabitatModel {
  factory JoinHabitatModel({
    required HUHabitatModel habitat,
    required List<HUHabitatModel> habitats,
    @Default(false) bool loading,
    String? error,
  }) = _JoinHabitatModel;

  factory JoinHabitatModel.fromJson(Map<String, Object?> json) =>
      _$JoinHabitatModelFromJson(json);
}
