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

    int addOn = 1; // 1 credit if action taken
    if (elapsed == goal.value) {
      // 2 credits if goal met
      addOn = 2;
    } else if (elapsed > goal.value) {
      // 3 credits if goal exceeded
      addOn = 3;
    }

    final updatedGoal = goal.copyWith(credits: goal.credits + addOn);

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
    final goal = habitatAndAction.habitat.goal.copyWith(value: elapsed);

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

      await ref.read(habitatProvider(state.habitat).notifier).loadProfiles();
      await ref.read(habitatProvider(state.habitat).notifier).loadActions();
      await ref.read(habitatProvider(state.habitat).notifier).loadCallouts();
      await ref
          .read(habitatProvider(state.habitat).notifier)
          .loadHabitatWithId(state.habitat.id);
      await ref.read(habitatsProvider.notifier).loadHabitats();
      await ref.read(habitatsProvider.notifier).loadActions();
      await ref.read(habitatsProvider.notifier).loadCallouts();
    }

    state = state.copyWith(
      loading: false,
      error: success ? null : 'Failed to save. Check network and try again.',
    );

    return success;
  }

  void setCalloutId(String id) {
    state = state.copyWith(calloutId: id);
  }
}
