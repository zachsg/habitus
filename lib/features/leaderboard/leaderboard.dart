import 'package:mobn/helpers/extensions.dart';
import 'package:mobn/models/xmodels.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/habit_type.dart';
import '../../services/database.dart';
import 'leaderboard_model.dart';

part 'leaderboard.g.dart';

@riverpod
class Leaderboard extends _$Leaderboard {
  @override
  LeaderboardModel build() => LeaderboardModel(
        habitat: HUHabitatModel(
          id: -1,
          updatedAt: DateTime.now(),
          creatorId: '',
          type: HabitType.read,
          teamGoalLastMet: DateTime.now(),
        ),
        habitats: [],
        profiles: [],
        credits: [],
        loading: true,
      );

  void setHabitat(HUHabitatModel habitat) {
    state = state.copyWith(habitat: habitat, loading: true);
    _reload();
  }

  Future<void> _reload() async {
    await loadProfiles();
    await loadCredits();
  }

  Future<void> loadHabitats() async {
    try {
      final habitats = await Database.habitats();
      state = state.copyWith(habitats: habitats);
    } on Exception catch (_) {
      state = state.copyWith(error: 'An error occurred', loading: false);
    }

    if (state.habitat.id == -1 && state.habitats.isNotEmpty) {
      setHabitat(state.habitats.first);
    }
  }

  Future<void> loadProfiles() async {
    final ids = [
      state.habitat.creatorId,
      ...state.habitat.admins,
      ...state.habitat.members,
    ];

    final profiles = await Database.profilesWithIds(ids);

    state = state.copyWith(profiles: profiles);
  }

  Future<void> loadCredits() async {
    final credits = await Database.creditsWithHabitatId(id: state.habitat.id);

    // Sort profiles by most points to fewest
    final today = DateTime.now();

    List<HUProfileModel> profiles = List.from(state.profiles);

    profiles.sort((a, b) {
      final creditA = credits.firstWhere(
        (credit) => credit.ownerId == a.id,
        orElse: () => HUCreditModel(
          updatedAt: today,
          ownerId: a.id,
          habitatId: state.habitat.id,
          year: today.year,
          weekNumber: today.weekNumber(),
          credits: 0,
        ),
      );

      final creditB = credits.firstWhere(
        (credit) => credit.ownerId == b.id,
        orElse: () => HUCreditModel(
          updatedAt: today,
          ownerId: b.id,
          habitatId: state.habitat.id,
          year: today.year,
          weekNumber: today.weekNumber(),
          credits: 0,
        ),
      );

      if (state.byCredit) {
        return creditA.credits > creditB.credits ? 0 : 1;
      } else {
        return creditA.accomplished > creditB.accomplished ? 0 : 1;
      }
    });

    state = state.copyWith(
      credits: credits,
      profiles: profiles,
      loading: false,
    );
  }

  void setIsByCredit(bool byCredit) =>
      state = state.copyWith(byCredit: byCredit);
}
