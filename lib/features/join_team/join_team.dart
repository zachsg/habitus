import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../helpers/strings.dart';
import '../../models/xmodels.dart';
import '../../services/database.dart';
import '../bottom_nav/bottom_nav_view.dart';
import '../home/home.dart';
import '../profile/profile.dart';
import 'join_team_model.dart';

part 'join_team.g.dart';

@riverpod
class JoinTeam extends _$JoinTeam {
  @override
  JoinTeamModel build() => JoinTeamModel(
      team: HUTeamModel(
        id: -1,
        updatedAt: DateTime.now(),
        creatorId: supabase.auth.currentUser?.id ?? '',
        goal: HUGoalModel(habit: readString, unit: Unit.minutes, value: 30),
      ),
      teams: [],
      loading: false);

  void updateTeamGoalHabit(String habit) {
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
    final goal = state.team.goal.copyWith(habit: habit, value: value);
    final team = state.team.copyWith(goal: goal);
    state = state.copyWith(team: team);
  }

  void incrementTeamGoalValue() {
    final value = state.team.goal.value;
    final goal = state.team.goal.copyWith(value: value + 5);
    final team = state.team.copyWith(goal: goal);
    state = state.copyWith(team: team);
  }

  void decrementTeamGoalValue() {
    final value = state.team.goal.value;
    if (value >= 5) {
      final goal = state.team.goal.copyWith(value: value - 5);
      final team = state.team.copyWith(goal: goal);
      state = state.copyWith(team: team);
    }
  }

  Future<void> findMatchingTeams() async {
    state = state.copyWith(loading: true);
    final name = state.team.goal.habit;
    final teams = await Database.teamsWithNamesContaining(name.substring(
      0,
      name.length - 1,
    ));
    if (teams.isEmpty) {
      state = state.copyWith(teams: teams, error: noTeamsFoundString);
    } else {
      state = state.copyWith(teams: teams, error: null);
    }

    state = state.copyWith(loading: false);
  }

  Future<void> joinTeam(BuildContext context, HUTeamModel team) async {
    state = state.copyWith(loading: true);

    await Database.joinTeam(team);

    final t = state.team.copyWith(id: team.id);
    state = state.copyWith(team: t);

    final profile = ref.read(profileProvider).profile;
    final teams = [...profile.teams, state.team.id];
    final goals = [...profile.goals, state.team.goal];
    final updatedProfile = profile.copyWith(teams: teams, goals: goals);

    await Database.updateProfileTeamsAndGoals(updatedProfile);

    await ref.read(homeProvider.notifier).loadTeams();

    state = state.copyWith(loading: false);

    if (context.mounted) {
      context.goNamed(BottomNavView.routeName);
    }
  }
}
