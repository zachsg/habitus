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

  void setMaxElapsed(int elapsed, int previousElapsed) {
    state = state.copyWith(maxElapsed: elapsed - previousElapsed);
  }

  void incrementSession() {
    if (state.elapsed >= state.maxElapsed) {
      return;
    }

    state = state.copyWith(elapsed: state.elapsed + 60);
  }

  void decrementSession() {
    if (state.elapsed <= 60) {
      return;
    }

    state = state.copyWith(elapsed: state.elapsed - 60);
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

    state = state.copyWith(loading: false);

    return success;
  }

  void setCalloutId(String id) {
    state = state.copyWith(calloutId: id);
  }
}
