import 'package:freezed_annotation/freezed_annotation.dart';

part 'h_u_credit_model.freezed.dart';
part 'h_u_credit_model.g.dart';

@freezed
class HUCreditModel with _$HUCreditModel {
  factory HUCreditModel({
    @Default(-1) int id,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'owner_id') required String ownerId,
    @JsonKey(name: 'habitat_id') required int habitatId,
    required int year,
    @JsonKey(name: 'week_number') required int weekNumber,
    @Default(0) int credits,
    @Default(0) int accomplished,
  }) = _HUCreditModel;

  factory HUCreditModel.fromJson(Map<String, Object?> json) =>
      _$HUCreditModelFromJson(json);
}
