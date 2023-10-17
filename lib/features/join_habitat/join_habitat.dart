import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobn/helpers/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/animals.dart';
import '../../helpers/strings.dart';
import '../../models/xmodels.dart';
import '../../services/database.dart';
import '../habitats/habitats.dart';
import '../habitats/habitats_view.dart';
import '../profile/profile.dart';
import 'join_habitat_model.dart';

part 'join_habitat.g.dart';

@riverpod
class JoinHabitat extends _$JoinHabitat {
  @override
  JoinHabitatModel build() => JoinHabitatModel(
        habitat: HUHabitatModel(
          id: -1,
          updatedAt: DateTime.now(),
          creatorId: supabase.auth.currentUser?.id ?? '',
          name: '${readString.habitDoing()} ${Animals.random().capitalize()}',
          goal: HUGoalModel(
            habitatId: 1,
            habit: readString,
            unit: Unit.minutes,
            value: 30,
          ),
        ),
        habitats: [],
        loading: false,
      );

  void updateHabitatGoalHabit(String habit) {
    int value;
    switch (habit) {
      case readString:
        value = 30;
      case exerciseString:
        value = 20;
      case meditateString:
        value = 10;
      case cookString:
        value = 10;
      default:
        value = 10;
    }
    final goal = state.habitat.goal.copyWith(habit: habit, value: value);

    final name = state.habitat.name.split(' ');
    final newName = '${habit.habitDoing()} ${name[1]}';

    final habitat = state.habitat.copyWith(name: newName, goal: goal);
    state = state.copyWith(habitat: habitat);
  }

  void updateHabitatNameHabit(String animal) {
    final name = state.habitat.name.split(' ');
    final newName = '${name.first} ${animal.capitalize()}';

    final habitat = state.habitat.copyWith(name: newName);
    state = state.copyWith(habitat: habitat);
  }

  void incrementHabitatGoalValue() {
    final value = state.habitat.goal.value;
    final goal = state.habitat.goal.copyWith(value: value + 5);
    final habitat = state.habitat.copyWith(goal: goal);
    state = state.copyWith(habitat: habitat);
  }

  void decrementHabitatGoalValue() {
    final value = state.habitat.goal.value;
    if (value >= 10) {
      final goal = state.habitat.goal.copyWith(value: value - 5);
      final habitat = state.habitat.copyWith(goal: goal);
      state = state.copyWith(habitat: habitat);
    }
  }

  void incrementCap() {
    final currentCap = state.habitat.cap;
    if (currentCap > 9) {
      return;
    }

    final habitat = state.habitat.copyWith(cap: currentCap + 1);
    state = state.copyWith(habitat: habitat);
  }

  void decrementCap() {
    final currentCap = state.habitat.cap;
    if (currentCap < 3) {
      return;
    }

    final habitat = state.habitat.copyWith(cap: currentCap - 1);
    state = state.copyWith(habitat: habitat);
  }

  void setIsOpen(bool isOpen) {
    final habitat = state.habitat.copyWith(isOpen: isOpen);
    state = state.copyWith(habitat: habitat);
  }

  void resetHabitat() => state = state.copyWith(
        habitat: HUHabitatModel(
          id: -1,
          updatedAt: DateTime.now(),
          creatorId: supabase.auth.currentUser?.id ?? '',
          name: '${readString.habitDoing()} ${Animals.random().capitalize()}',
          goal: HUGoalModel(
            habitatId: 1,
            habit: readString,
            unit: Unit.minutes,
            value: 30,
          ),
        ),
        habitats: [],
        loading: false,
      );

  Future<void> findMatchingHabitats() async {
    state = state.copyWith(loading: true);
    final name = state.habitat.goal.habit;
    final habitats = await Database.habitatsWithNamesContaining(name.substring(
      0,
      name.length - 1,
    ));

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

  Future<void> makeHabitat(BuildContext context) async {
    state = state.copyWith(loading: true);

    // Make habitat
    final profile = ref.read(profileProvider).profile;
    final habitat = state.habitat.copyWith(creatorId: profile.id);
    state = state.copyWith(habitat: habitat);
    final id = await Database.makeHabitat(state.habitat);

    // Update habitat with correct goal in database
    final goal = state.habitat.goal.copyWith(habitatId: id);
    final updateHabitat = state.habitat.copyWith(id: id, goal: goal);
    state = state.copyWith(habitat: updateHabitat);
    await Database.updateHabitat(state.habitat);

    // Update user profile with new habitat
    final goals = [...profile.goals, state.habitat.goal];
    final updatedProfile = profile.copyWith(goals: goals);
    await Database.updateProfileHabitatsAndGoals(updatedProfile);

    // Reload habitats and use profile
    await ref.read(habitatsProvider.notifier).loadHabitats();
    await ref.read(profileProvider.notifier).loadProfile();

    state = state.copyWith(loading: false);

    if (context.mounted) {
      context.goNamed(HabitatsView.routeName);
    }
  }

  Future<void> joinHabitat(BuildContext context, HUHabitatModel habitat) async {
    state = state.copyWith(loading: true);

    final g = state.habitat.goal.copyWith(habitatId: habitat.id);
    final h = state.habitat.copyWith(id: habitat.id, goal: g);
    state = state.copyWith(habitat: h);

    final profile = ref.read(profileProvider).profile;
    final goals = [...profile.goals, state.habitat.goal];
    final updatedProfile = profile.copyWith(goals: goals);

    await Database.updateProfileHabitatsAndGoals(updatedProfile);

    final goal = habitat.goal
        .copyWith(value: habitat.goal.value + state.habitat.goal.value);

    final habitatUpdated = habitat.copyWith(
      goal: goal,
      members: [...habitat.members, profile.id],
    );

    await Database.updateHabitat(habitatUpdated);

    await ref.read(habitatsProvider.notifier).loadHabitats();

    await ref.read(profileProvider.notifier).loadProfile();

    state = state.copyWith(loading: false);

    if (context.mounted) {
      context.goNamed(HabitatsView.routeName);
    }
  }

  Future<void> createHabitat(BuildContext context) async {
    // TODO: Create new habitat in DB
    // 1. Ensure user is set as creator of habitat
    // 2. Add newly created habitat ID to user's profile 'habitats' and 'goals'
  }

  void setIsJoining(bool isJoining) => state = state.copyWith(
        isJoining: isJoining,
        error: null,
      );
}
