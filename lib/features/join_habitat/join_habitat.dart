import 'package:mobn/helpers/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../helpers/strings.dart';
import '../../models/animal.dart';
import '../../models/habit_type.dart';
import '../../models/xmodels.dart';
import '../../services/database.dart';
import '../habitats/habitats.dart';
import '../profile/profile.dart';
import 'join_habitat_model.dart';

part 'join_habitat.g.dart';

@riverpod
class JoinHabitat extends _$JoinHabitat {
  @override
  JoinHabitatModel build() => JoinHabitatModel(
        habitats: [],
        loading: false,
      );

  void updateHabitType(HabitType type) {
    int value;
    switch (type) {
      case HabitType.read:
        value = 30;
      case HabitType.exercise:
        value = 20;
      case HabitType.meditate:
        value = 10;
      case HabitType.cook:
        value = 10;
      default:
        value = 10;
    }

    state = state.copyWith(type: type, goal: value);
  }

  void updateAnimal(Animal animal) => state = state.copyWith(animal: animal);

  void incrementGoal() => state = state.copyWith(goal: state.goal + 5);

  void decrementGoal() {
    if (state.goal >= 10) {
      state = state.copyWith(goal: state.goal - 5);
    }
  }

  void incrementCap() {
    if (state.cap > 9) {
      return;
    }

    state = state.copyWith(cap: state.cap + 1);
  }

  void decrementCap() {
    if (state.cap < 3) {
      return;
    }

    state = state.copyWith(cap: state.cap - 1);
  }

  void setIsOpen(bool isOpen) => state = state.copyWith(isOpen: isOpen);

  void resetHabitat() => state = state.copyWith(
        unit: Unit.minutes,
        goal: 10,
        habitats: [],
        loading: false,
      );

  Future<void> findMatchingHabitats() async {
    state = state.copyWith(loading: true);

    final name = state.type.name.capitalize();
    final habitats = await Database.habitatsWithNamesContaining(
      name.substring(
        0,
        name.length - 1,
      ),
    );

    habitats.removeWhere((habitat) {
      final members = habitat.admins.length + habitat.members.length + 1;
      return habitat.cap <= members;
    });

    if (habitats.isEmpty) {
      state = state.copyWith(habitats: habitats, error: noHabitatsFoundString);
    } else {
      state = state.copyWith(habitats: habitats, error: null);
    }

    state = state.copyWith(loading: false);
  }

  Future<void> makeHabitat() async {
    state = state.copyWith(loading: true);

    // Make habitat
    final name =
        '${state.type.name.habitDoing()} ${state.animal.name.capitalize()}';
    final profile = ref.read(profileProvider).profile;
    final now = DateTime.now().toLocal();
    final habitat = HUHabitatModel(
      id: -1,
      updatedAt: now,
      creatorId: profile.id,
      name: name,
      type: state.type,
      unit: state.unit,
      cap: state.cap,
      isOpen: state.isOpen,
      teamGoal: state.goal,
      teamGoalLastMet: now.subtract(const Duration(days: 1)),
    );

    final id = await Database.makeHabitat(habitat);

    final updatedHabitat = habitat.copyWith(id: id);

    // Update user profile with new habitat
    final goal = HUGoalModel(
      habitatId: updatedHabitat.id,
      habit: updatedHabitat.type.name,
      unit: updatedHabitat.unit,
      value: updatedHabitat.teamGoal,
      credits: 0,
      dateOfLastCredit: now.subtract(const Duration(days: 1)),
      daysOff: [],
    );
    final goals = [...profile.goals, goal];
    final updatedProfile = profile.copyWith(goals: goals);
    await Database.updateProfileHabitatsAndGoals(updatedProfile);

    // Reload habitats and use profile
    await ref.read(profileProvider.notifier).loadProfile();
    await ref.read(habitatsProvider.notifier).loadHabitats();

    state = state.copyWith(loading: false);
  }

  Future<void> joinHabitat(HUHabitatModel habitat) async {
    state = state.copyWith(loading: true);

    // Update user profile with new goal
    final profile = ref.read(profileProvider).profile;
    final goal = HUGoalModel(
      habitatId: habitat.id,
      habit: habitat.type.name,
      unit: habitat.unit,
      value: state.goal,
    );
    final goals = [...profile.goals, goal];
    final updatedProfile = profile.copyWith(goals: goals);
    await Database.updateProfileHabitatsAndGoals(updatedProfile);

    // Update habitat team goal and members
    final habitatUpdated = habitat.copyWith(
      teamGoal: habitat.teamGoal + state.goal,
      members: [...habitat.members, profile.id],
    );
    await Database.updateHabitat(habitatUpdated);

    await ref.read(habitatsProvider.notifier).loadHabitats();
    await ref.read(profileProvider.notifier).loadProfile();

    state = state.copyWith(loading: false);
  }

  void setIsJoining(bool isJoining) => state = state.copyWith(
        isJoining: isJoining,
        error: null,
      );
}
