import 'package:mobn/features/profile/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/xmodels.dart';
import '../../services/database.dart';
import '../../services/remote_notification_service.dart';
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
    matchesToRemove.addAll({
      me,
      creator,
      ...admins,
      ...members,
      'ce12b645-8698-442b-93ea-b2e3e0a9586e', // Habitus
      '8541403c-9039-488f-a9b0-e471717e5631', // Mobn
      '84f2b88c-8ad8-4fd7-a996-4950324f353c', // Demo
      '213d8a2d-9a2f-41f2-ac24-f1d51f39022d', // redacted
    });

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

    final goal = HUGoalModel(
        habitatId: state.habitat.id,
        habit: state.habitat.type.name,
        unit: state.habitat.unit,
        value: 10);
    final goals = [...profile.goals, goal];
    final updatedProfile = profile.copyWith(goals: goals);
    await Database.updateProfileHabitatsAndGoals(updatedProfile);

    final habitatUpdated = state.habitat.copyWith(
      teamGoal: state.habitat.teamGoal + 10,
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

    final token = profile.pushToken;
    final title = 'Added to ${habitat.name}';
    final inviter = ref.read(profileProvider).profile;
    final subtitle = '@${inviter.handle} just added you to ${habitat.name}';

    await RemoteNotificationService.inviteNotification(
      token: token,
      title: title,
      subtitle: subtitle,
      habitat: habitat,
    );

    state = state.copyWith(loading: false);
  }

  void clearPossibleInvites() => state = state.copyWith(
        possibleInvites: [],
        search: '',
      );

  void setSearch(String search) => state = state.copyWith(search: search);

  Future<void> saveNewGoal() async {
    // Update habitat team goal
    await Database.updateHabitat(state.habitat);

    // Update user profile with new goal
    await Database.updateProfileHabitatsAndGoals(state.profile);

    // Reload habitat and profile
    await ref
        .read(habitatProvider(state.habitat).notifier)
        .loadHabitatWithId(state.habitat.id);
    await ref.read(habitatsProvider.notifier).loadHabitats();
    await ref.read(profileProvider.notifier).loadProfile();
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

    int teamGoal;
    if (state.habitat.teamGoal > 5) {
      teamGoal = state.habitat.teamGoal - 5;
    } else {
      teamGoal = state.habitat.teamGoal;
    }
    final habitat = state.habitat.copyWith(teamGoal: teamGoal);

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

    final habitat =
        state.habitat.copyWith(teamGoal: state.habitat.teamGoal + 5);

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
    final newTeamGoal = habitat.teamGoal - userGoal.value;

    if (isOwner) {
      final areAdmins = habitat.admins.isNotEmpty;
      final areMembers = habitat.members.isNotEmpty;
      if (areAdmins) {
        // Promote an admin to owner

        final newCreator = habitat.admins.first;
        final List<String> admins = List.from(habitat.admins);
        admins.removeAt(0);

        final updatedHabitat = habitat.copyWith(
          creatorId: newCreator,
          admins: admins,
          teamGoal: newTeamGoal,
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
          teamGoal: newTeamGoal,
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
        teamGoal: newTeamGoal,
      );

      await Database.updateHabitat(updatedHabitat);
    } else {
      // I am a member, remove me
      final newMembers = habitat.members
          .where((member) => member != state.profile.id)
          .toList();

      final updatedHabitat = habitat.copyWith(
        members: newMembers,
        teamGoal: newTeamGoal,
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
