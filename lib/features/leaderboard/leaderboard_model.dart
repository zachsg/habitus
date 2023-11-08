import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/xmodels.dart';

part 'leaderboard_model.freezed.dart';
part 'leaderboard_model.g.dart';

@freezed
class LeaderboardModel with _$LeaderboardModel {
  factory LeaderboardModel({
    required HUHabitatModel habitat,
    @Default([]) List<HUHabitatModel> habitats,
    @Default([]) List<HUProfileModel> profiles,
    @Default([]) List<HUCreditModel> credits,
    @Default(false) bool loading,
    String? error,
  }) = _LeaderboardModel;

  factory LeaderboardModel.fromJson(Map<String, Object?> json) =>
      _$LeaderboardModelFromJson(json);
}
