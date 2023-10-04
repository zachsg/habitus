import 'package:flutter/cupertino.dart';
import 'package:habitus/features/profile/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/xmodels.dart';
import '../../services/database.dart';
import '../habitats/habitats.dart';
import 'habitat_settings_model.dart';

part 'habitat_settings.g.dart';

@riverpod
class HabitatSettings extends _$HabitatSettings {
  @override
  HabitatSettingsModel build(HUHabitatModel habitat) => HabitatSettingsModel(
        habitat: habitat,
        profile: ref.read(profileProvider).profile,
      );

  Future<void> saveNewGoal(BuildContext context) async {
    // Update habitat team goal
    await Database.updateHabitat(state.habitat);

    // Update user profile with new goal
    await Database.updateProfileHabitatsAndGoals(state.profile);

    // Reload habitat and profile
    await ref.read(habitatsProvider.notifier).loadHabitats();
    await ref.read(profileProvider.notifier).loadProfile();

    // Pop context to dismiss the sheet
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  Future<void> cancelGoalEdits() async {
    final profile = ref.watch(profileProvider).profile;
    state = state.copyWith(profile: profile);
  }

  void decrementHabitatGoal() {
    final profileGoals = state.profile.goals;
    final List<HUGoalModel> updateProfileGoals = [];
    for (final goal in profileGoals) {
      if (goal.habitatId == state.habitat.id && goal.value > 5) {
        final g = goal.copyWith(value: goal.value - 5);
        updateProfileGoals.add(g);
      } else {
        updateProfileGoals.add(goal);
      }
    }
    final profile = state.profile.copyWith(goals: updateProfileGoals);

    HUGoalModel habitatGoal;
    if (state.habitat.goal.value > 5) {
      habitatGoal =
          state.habitat.goal.copyWith(value: state.habitat.goal.value - 5);
    } else {
      habitatGoal = state.habitat.goal;
    }
    final habitat = state.habitat.copyWith(goal: habitatGoal);

    state = state.copyWith(profile: profile, habitat: habitat);
  }

  void incrementHabitatGoal() {
    final profileGoals = state.profile.goals;
    final List<HUGoalModel> updateProfileGoals = [];
    for (final goal in profileGoals) {
      if (goal.habitatId == state.habitat.id) {
        final g = goal.copyWith(value: goal.value + 5);
        updateProfileGoals.add(g);
      } else {
        updateProfileGoals.add(goal);
      }
    }
    final profile = state.profile.copyWith(goals: updateProfileGoals);

    final habitatGoal =
        state.habitat.goal.copyWith(value: state.habitat.goal.value + 5);
    final habitat = state.habitat.copyWith(goal: habitatGoal);

    state = state.copyWith(profile: profile, habitat: habitat);
  }
}
