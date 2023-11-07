import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/xmodels.dart';
import '../../services/database.dart';
import '../habitat/habitat.dart';
import '../habitats/habitats.dart';
import '../profile/profile.dart';
import 'grow_model.dart';

part 'grow.g.dart';

@Riverpod(keepAlive: true)
class Grow extends _$Grow {
  @override
  GrowModel build(HUHabitatAndActionModel habitatAndAction) {
    final goal = ref
        .read(profileProvider)
        .profile
        .goals
        .firstWhere((goal) => goal.habitatId == habitatAndAction.habitat.id);

    bool goalMet = false;
    if (goal.value < habitatAndAction.elapsed) {
      goalMet = true;
    }
    return GrowModel(
      habitat: habitatAndAction.habitat,
      elapsed: habitatAndAction.elapsed * 60,
      loading: false,
      goalMet: goalMet,
    );
  }

  void setElapsed(int elapsed) {
    state = state.copyWith(elapsed: elapsed);
  }

  void setAlreadyElapsed(int elapsed) {
    state = state.copyWith(alreadyElapsed: elapsed);
  }

  void setGoalMet(bool goalMet) {
    state = state.copyWith(goalMet: goalMet);
  }

  void setPaused(bool paused) {
    state = state.copyWith(isPaused: paused, loading: false);
  }

  Future<bool> _addCredits(HUProfileModel profile, int elapsed) async {
    final goal =
        profile.goals.firstWhere((goal) => goal.habitatId == state.habitat.id);

    if (goal.dateOfLastCredit != null) {
      if (goal.dateOfLastCredit!
          .isAfter(DateTime.now().copyWith(hour: 0, minute: 0))) {
        // Already received credits today, no more soup for you!
        return true;
      }
    }

    int addOn = 1; // 1 credit if action taken
    if (elapsed == goal.value) {
      // 2 credits if goal met
      addOn = 2;
    } else if (elapsed > goal.value) {
      // 3 credits if goal exceeded
      addOn = 3;
    }

    final updatedGoal = goal.copyWith(
      credits: goal.credits + addOn,
      dateOfLastCredit: DateTime.now().toUtc(),
    );

    final List<HUGoalModel> goals = [];
    for (final g in profile.goals) {
      if (g.habitatId == updatedGoal.habitatId) {
        goals.add(updatedGoal);
      } else {
        goals.add(g);
      }
    }

    final updateProfile = profile.copyWith(goals: goals);

    final success = await Database.updateProfileHabitatsAndGoals(updateProfile);
    if (success) {
      await ref.read(profileProvider.notifier).loadProfile();
    }

    return success;
  }

  Future<bool> save(int elapsed) async {
    if (elapsed < 1) {
      return true;
    }

    state = state.copyWith(loading: true);

    final profile = ref.read(profileProvider).profile;
    final createdAt = DateTime.now().toUtc();
    final habitat = habitatAndAction.habitat;
    final goal = HUGoalModel(
      habitatId: habitat.id,
      habit: habitat.type.name,
      unit: habitat.unit,
      value: elapsed,
    );

    final action = HUActionModel(
      id: 0,
      habitatId: state.habitat.id,
      ownerId: profile.id,
      createdAt: createdAt,
      goal: goal,
    );

    final success = await Database.saveAction(state.habitat, action);
    if (success) {
      await _addCredits(profile, elapsed);

      if (state.calloutId.isNotEmpty) {
        final callout = HUCalloutModel(
          id: -1,
          habitatId: state.habitat.id,
          createdAt: DateTime.now().toLocal(),
          caller: profile.id,
          callee: state.calloutId,
        );
        await Database.addCallout(callout);
      }

      await ref.read(habitatProvider(state.habitat).notifier).loadCallouts();

      final callouts = ref.read(habitatProvider(state.habitat)).callouts;
      final List<String> calloutIds = [];
      for (final callout in callouts) {
        if (!callout.done) {
          calloutIds.add(callout.callee);
        }
      }

      if (calloutIds.contains(profile.id)) {
        final c =
            callouts.where((callout) => callout.callee == profile.id).toList();
        await Database.markCalloutDone(c);
      }

      await ref
          .read(habitatProvider(habitatAndAction.habitat).notifier)
          .loadProfiles();
      await ref
          .read(habitatProvider(habitatAndAction.habitat).notifier)
          .loadActions();
      await ref
          .read(habitatProvider(habitatAndAction.habitat).notifier)
          .loadCallouts();
      await ref
          .read(habitatProvider(habitatAndAction.habitat).notifier)
          .loadHabitatWithId(state.habitat.id);
      await ref.read(habitatsProvider.notifier).loadHabitats();
      await ref.read(habitatsProvider.notifier).loadActions();
      await ref.read(habitatsProvider.notifier).loadCallouts();

      final habitat =
          ref.read(habitatProvider(habitatAndAction.habitat)).habitat;
      if (habitat.teamGoalLastMet
          .isBefore(DateTime.now().copyWith(hour: 0, minute: 0))) {
        final actions = ref.read(habitatProvider(state.habitat)).actions;
        int accomplished = elapsed;
        for (final action in actions) {
          accomplished += action.goal.value;
        }

        if (accomplished >= habitat.teamGoal) {
          await giveTeamCredit();
        }
      }
    }

    state = state.copyWith(
      loading: false,
      error: success ? null : 'Failed to save. Check network and try again.',
    );

    return success;
  }

  Future<void> giveTeamCredit() async {
    await ref
        .read(habitatProvider(state.habitat).notifier)
        .loadHabitatWithId(state.habitat.id);
    final habitatP = ref.read(habitatProvider(state.habitat));

    if (habitatP.habitat.teamGoalLastMet
        .isAfter(DateTime.now().copyWith(hour: 0, minute: 0))) {
      // Credit already given today
      return;
    }

    // Give credit to each member of the team
    for (final profile in habitatP.profiles) {
      final goal = profile.goals
          .firstWhere((goal) => goal.habitatId == state.habitat.id);

      final updatedGoal = goal.copyWith(credits: goal.credits + 5);

      List<HUGoalModel> goals = [];
      for (final g in profile.goals) {
        if (g.habitatId == state.habitat.id) {
          goals.add(updatedGoal);
        } else {
          goals.add(g);
        }
      }

      final updateProfile = profile.copyWith(goals: goals);
      await Database.updateProfileHabitatsAndGoals(updateProfile);

      final p = ref.read(profileProvider).profile;
      if (profile.id == p.id) {
        await ref.read(profileProvider.notifier).loadProfile();
      }
    }

    await ref.read(habitatProvider(state.habitat).notifier).loadProfiles();

    // Update habitat date of last credit recieved by team
    final updatedHabitat =
        habitatP.habitat.copyWith(teamGoalLastMet: DateTime.now().toUtc());
    await Database.updateHabitat(updatedHabitat);
  }

  void setCalloutId(String id) {
    state = state.copyWith(calloutId: id);
  }
}
