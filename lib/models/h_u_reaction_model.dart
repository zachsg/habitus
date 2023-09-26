import 'package:freezed_annotation/freezed_annotation.dart';

part 'h_u_reaction_model.freezed.dart';
part 'h_u_reaction_model.g.dart';

@freezed
class HUReactionModel with _$HUReactionModel {
  factory HUReactionModel({
    required int id,
    @JsonKey(name: 'action_id') required int actionId,
    @JsonKey(name: 'owner_id') required String ownerId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @Default('') String icon,
    @Default('') String text,
  }) = _HUReactionModel;

  factory HUReactionModel.fromJson(Map<String, Object?> json) =>
      _$HUReactionModelFromJson(json);
}
