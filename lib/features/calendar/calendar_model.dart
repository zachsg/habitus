import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/xmodels.dart';

part 'calendar_model.freezed.dart';
part 'calendar_model.g.dart';

@freezed
class CalendarModel with _$CalendarModel {
  factory CalendarModel({
    required List<HUHabitatModel> habitats,
    required HUHabitatModel habitat,
    @Default([]) List<HUActionModel> actions,
    @Default(false) bool loading,
    String? error,
  }) = _CalendarModel;

  factory CalendarModel.fromJson(Map<String, Object?> json) =>
      _$CalendarModelFromJson(json);
}
