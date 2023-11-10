import 'package:mobn/helpers/extensions.dart';
import 'package:mobn/models/xmodels.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/habit_type.dart';
import '../../services/database.dart';
import '../profile/profile.dart';
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
        byHabitat: true,
        byCredit: true,
        habitats: [],
        profiles: [],
        credits: [],
        loading: true,
      );

  void setHabitType(HabitType habitType) {
    state = state.copyWith(habitType: habitType);
    _reloadGlobal();
  }

  Future<void> _reloadGlobal() async {
    await loadProfilesGlobal();
    await loadCreditsGlobal();
  }

  void setHabitat(HUHabitatModel habitat) {
    state = state.copyWith(habitat: habitat, loading: true);
    _reloadHabitats();
  }

  Future<void> _reloadHabitats() async {
    await loadProfilesHabitats();
    await loadCreditsHabitats();
  }

  Future<void> loadHabitatsHabitats() async {
    try {
      final habitats = await Database.habitats();
      state = state.copyWith(habitats: habitats);
    } on Exception catch (_) {
      state = state.copyWith(error: 'An error occurred', loading: false);
    }

    if (state.habitat.id == -1 && state.habitats.isNotEmpty) {
      setHabitat(state.habitats.first);
    }

    final goals = ref.read(profileProvider).profile.goals;
    final habitType = HabitType.values
        .firstWhere((type) => type.name == goals.first.habit.toLowerCase());
    ref.read(leaderboardProvider.notifier).setHabitType(habitType);
  }

  Future<void> loadProfilesHabitats() async {
    final ids = [
      state.habitat.creatorId,
      ...state.habitat.admins,
      ...state.habitat.members,
    ];

    final profiles = await Database.profilesWithIds(ids);

    state = state.copyWith(profiles: profiles);
  }

  Future<void> loadCreditsHabitats() async {
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

  void setIsByCredit(bool byCredit) {
    state = state.copyWith(byCredit: byCredit);
    state.byHabitat ? loadCreditsHabitats() : loadCreditsGlobal();
  }

  void setIsByHabitat(bool byHabitat) {
    state = state.copyWith(byHabitat: byHabitat);
    byHabitat ? _reloadHabitats() : _reloadGlobal();
  }

  // Future<void> loadHabitatsGlobal() async {}

  Future<void> loadProfilesGlobal() async {
    final profiles = await Database.allProfiles();

    final List<HUProfileModel> possibleProfiles = [];
    for (final profile in profiles) {
      for (final goal in profile.goals) {
        if (goal.habit.toLowerCase() == state.habitType.name) {
          possibleProfiles.add(profile);
          break;
        }
      }
    }

    state = state.copyWith(profiles: possibleProfiles);
  }

  Future<void> loadCreditsGlobal() async {
    final List<int> ids = [];
    for (final profile in state.profiles) {
      for (final goal in profile.goals) {
        if (goal.habit.toLowerCase() == state.habitType.name) {
          ids.add(goal.habitatId);
          break;
        }
      }
    }
    final credits = await Database.creditsWithHabitatIds(ids: ids);

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
}
