import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_nav_model.freezed.dart';
part 'bottom_nav_model.g.dart';

@freezed
class BottomNavModel with _$BottomNavModel {
  factory BottomNavModel({
    @Default(1) int index,
  }) = _BottomNavModel;

  factory BottomNavModel.fromJson(Map<String, Object?> json) =>
      _$BottomNavModelFromJson(json);
}
