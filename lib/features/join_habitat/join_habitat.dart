import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../helpers/strings.dart';
import '../../models/xmodels.dart';
import '../../services/database.dart';
import '../bottom_nav/bottom_nav_view.dart';
import '../habitats/habitats.dart';
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
        goal: HUGoalModel(
          habitatId: 1,
          habit: readString,
          unit: Unit.minutes,
          value: 30,
        ),
      ),
      habitats: [],
      loading: false);

  void updateHabitatGoalHabit(String habit) {
    int value;
    switch (habit) {
      case readString:
        value = 30;
      case exerciseString:
        value = 20;
      case meditateString:
        value = 10;
      default:
        value = 0;
    }
    final goal = state.habitat.goal.copyWith(habit: habit, value: value);
    final habitat = state.habitat.copyWith(goal: goal);
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
    if (value >= 5) {
      final goal = state.habitat.goal.copyWith(value: value - 5);
      final habitat = state.habitat.copyWith(goal: goal);
      state = state.copyWith(habitat: habitat);
    }
  }

  Future<void> findMatchingHabitats() async {
    state = state.copyWith(loading: true);
    final name = state.habitat.goal.habit;
    final habitats = await Database.habitatsWithNamesContaining(name.substring(
      0,
      name.length - 1,
    ));
    if (habitats.isEmpty) {
      state = state.copyWith(habitats: habitats, error: noHabitatsFoundString);
    } else {
      state = state.copyWith(habitats: habitats, error: null);
    }

    state = state.copyWith(loading: false);
  }

  Future<void> joinHabitat(BuildContext context, HUHabitatModel habitat) async {
    state = state.copyWith(loading: true);

    final h = state.habitat.copyWith(id: habitat.id);
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
      context.goNamed(BottomNavView.routeName);
    }
  }

  Future<void> createHabitat(BuildContext context) async {
    // TODO: Create new habitat in DB
    // 1. Ensure user is set as creator of habitat
    // 2. Add newly created habitat ID to user's profile 'habitats' and 'goals'
  }
}
