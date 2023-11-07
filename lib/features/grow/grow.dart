import 'package:mobn/helpers/extensions.dart';
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
      await _addCredits(elapsed);

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
          .loadCredits();
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
          await _giveTeamCredit();
        }
      }
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

  Future<bool> _addCredits(int elapsed) async {
    final profile = ref.read(profileProvider).profile;
    final credits = ref.read(habitatProvider(habitatAndAction.habitat)).credits;
    final today = DateTime.now();
    final credit = credits.firstWhere(
      (credit) =>
          credit.ownerId == profile.id &&
          credit.weekNumber == today.weekNumber() &&
          credit.year == today.year,
      orElse: () => HUCreditModel(
        id: -1,
        updatedAt: DateTime.now().toUtc(),
        ownerId: profile.id,
        habitatId: habitatAndAction.habitat.id,
        year: today.year,
        weekNumber: today.weekNumber(),
        credits: 0,
      ),
    );

    // If user already received credit today, do nothing
    if (credit.id != -1 &&
        credit.updatedAt.isAfter(today.copyWith(hour: 0, minute: 0))) {
      return true;
    }

    final goal = profile.goals
        .firstWhere((goal) => goal.habitatId == habitatAndAction.habitat.id);
    int creditsEarned = 0;
    if (elapsed < goal.value) {
      creditsEarned = 1;
    } else if (elapsed == goal.value) {
      creditsEarned = 2;
    } else {
      creditsEarned = 3;
    }

    final updatedCredit = credit.copyWith(
      credits: credit.credits + creditsEarned,
      updatedAt: DateTime.now().toUtc(),
    );
    final success = await Database.addCredits(credit: updatedCredit);

    return success;
  }

  Future<void> _giveTeamCredit() async {
    final habitatP = ref.read(habitatProvider(state.habitat));
    final today = DateTime.now();
    if (habitatP.habitat.teamGoalLastMet
        .isAfter(today.copyWith(hour: 0, minute: 0))) {
      return;
    }

    for (final profile in habitatP.profiles) {
      final credit = habitatP.credits.firstWhere(
        (credit) =>
            credit.ownerId == profile.id &&
            credit.weekNumber == today.weekNumber() &&
            credit.year == today.year,
        orElse: () => HUCreditModel(
          id: -1,
          updatedAt: DateTime.now().toUtc(),
          ownerId: profile.id,
          habitatId: habitatAndAction.habitat.id,
          year: today.year,
          weekNumber: today.weekNumber(),
          credits: 0,
        ),
      );

      final updatedCredit = credit.copyWith(
        credits: credit.credits + 5,
        updatedAt: DateTime.now().toUtc(),
      );
      await Database.addCredits(credit: updatedCredit);
    }

    // Update habitat date of last credit recieved by team
    final updatedHabitat =
        habitatP.habitat.copyWith(teamGoalLastMet: DateTime.now().toUtc());
    await Database.updateHabitat(updatedHabitat);
  }
}
