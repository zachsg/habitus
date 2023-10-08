import 'package:flutter/cupertino.dart';
import 'package:habitus/features/profile/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/xmodels.dart';
import '../../services/database.dart';
import '../habitat/habitat.dart';
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

  Future<void> searchForHabitmates(String searchTerm) async {
    state = state.copyWith(loading: true);

    final matches = await Database.searchForHabitmates(searchTerm);

    final me = state.profile.id;
    final creator = state.habitat.creatorId;
    final admins = state.habitat.admins;
    final members = state.habitat.members;
    final Set<String> matchesToRemove = {};
    matchesToRemove.addAll({me, creator, ...admins, ...members});

    final List<HUProfileModel> matchesCleaned = [];
    for (final match in matches) {
      if (!matchesToRemove.contains(match.id)) {
        matchesCleaned.add(match);
      }
    }

    state = state.copyWith(possibleInvites: matchesCleaned, loading: false);
  }

  Future<void> invite(HUProfileModel profile) async {
    state = state.copyWith(loading: true);

    final parentHabitat = state.habitat;

    final goal = state.habitat.goal.copyWith(value: 10);
    final goals = [...profile.goals, goal];
    final updatedProfile = profile.copyWith(goals: goals);
    await Database.updateProfileHabitatsAndGoals(updatedProfile);

    final habitatGoal =
        state.habitat.goal.copyWith(value: state.habitat.goal.value + 10);

    final habitatUpdated = state.habitat.copyWith(
      goal: habitatGoal,
      members: [...state.habitat.members, profile.id],
    );
    await Database.updateHabitat(habitatUpdated);

    final habitat = await Database.habitatWithId(state.habitat.id);
    state = state.copyWith(habitat: habitat);
    await searchForHabitmates(state.search);

    await ref.read(habitatsProvider.notifier).loadHabitats();
    await ref
        .read(habitatProvider(parentHabitat).notifier)
        .loadHabitatWithId(parentHabitat.id);
    await ref.read(habitatProvider(parentHabitat).notifier).loadProfiles();

    state = state.copyWith(loading: false);
  }

  void setSearch(String search) => state = state.copyWith(search: search);

  Future<void> saveNewGoal(BuildContext context) async {
    // Update habitat team goal
    await Database.updateHabitat(state.habitat);

    // Update user profile with new goal
    await Database.updateProfileHabitatsAndGoals(state.profile);

    // Reload habitat and profile
    await ref.read(habitatsProvider.notifier).loadHabitats();
    await ref.read(profileProvider.notifier).loadProfile();

    // Dismiss the sheet
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

  Future<void> leaveHabitat() async {
    // Get latest version of habitat just in case we have a dated copy
    final habitat = await Database.habitatWithId(state.habitat.id);

    // Remove user from habitat.
    final isOwner = habitat.creatorId == state.profile.id;
    final isAdmin = habitat.admins.contains(state.profile.id);
    final userGoal =
        state.profile.goals.firstWhere((goal) => goal.habitatId == habitat.id);
    final newGoal =
        habitat.goal.copyWith(value: habitat.goal.value - userGoal.value);
    if (isOwner) {
      final areAdmins = habitat.admins.isNotEmpty;
      final areMembers = habitat.members.isNotEmpty;
      if (areAdmins) {
        // Promote an admin to owner

        final newCreator = habitat.admins.first;
        habitat.admins.removeAt(0);

        final updatedHabitat = habitat.copyWith(
          creatorId: newCreator,
          admins: habitat.admins,
          goal: newGoal,
        );

        await Database.updateHabitat(updatedHabitat);
      } else if (areMembers) {
        // Promote another member to owner
        String newCreator = '';
        List<String> newMembers = [];
        for (final member in habitat.members) {
          if (habitat.members.first == member) {
            newCreator = member;
          } else {
            newMembers.add(member);
          }
        }

        final updatedHabitat = habitat.copyWith(
          creatorId: newCreator,
          members: newMembers,
          goal: newGoal,
        );

        await Database.updateHabitat(updatedHabitat);
      } else {
        // I'm the only one here... delete the habitat
        await Database.deleteHabitat(habitat);
      }
    } else if (isAdmin) {
      // I am an admin, remove me
      final newAdmins =
          habitat.admins.where((admin) => admin != state.profile.id).toList();

      final updatedHabitat = habitat.copyWith(
        admins: newAdmins,
        goal: newGoal,
      );

      await Database.updateHabitat(updatedHabitat);
    } else {
      // I am a member, remove me
      final newMembers = habitat.members
          .where((member) => member != state.profile.id)
          .toList();

      final updatedHabitat = habitat.copyWith(
        members: newMembers,
        goal: newGoal,
      );

      await Database.updateHabitat(updatedHabitat);
    }

    // Remove the habitat and goal from the user's profile
    final goals = state.profile.goals
        .where((goal) => goal.habitatId != habitat.id)
        .toList();
    final updatedProfile = state.profile.copyWith(goals: goals);

    await Database.updateProfileHabitatsAndGoals(updatedProfile);

    await ref.read(habitatsProvider.notifier).loadHabitats();
  }
}
