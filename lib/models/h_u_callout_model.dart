import 'package:freezed_annotation/freezed_annotation.dart';

part 'h_u_callout_model.freezed.dart';
part 'h_u_callout_model.g.dart';

@freezed
class HUCalloutModel with _$HUCalloutModel {
  factory HUCalloutModel({
    required int id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'habitat_id') required int habitatId,
    required String caller,
    required String callee,
    @Default(false) bool done,
  }) = _HUCalloutModel;

  factory HUCalloutModel.fromJson(Map<String, Object?> json) =>
      _$HUCalloutModelFromJson(json);
}
