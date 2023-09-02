import 'package:freezed_annotation/freezed_annotation.dart';

import 'xmodels.dart';

part 'h_u_action_model.freezed.dart';
part 'h_u_action_model.g.dart';

@freezed
class HUActionModel with _$HUActionModel {
  factory HUActionModel({
    required int id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'owner_id') required String ownerId,
    required String name,
    required Unit unit,
    required int value,
  }) = _HUActionModel;

  factory HUActionModel.fromJson(Map<String, Object?> json) =>
      _$HUActionModelFromJson(json);
}
