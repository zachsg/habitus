import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/xmodels.dart';
import '../../services/database.dart';
import 'calendar_model.dart';

part 'calendar.g.dart';

@riverpod
class Calendar extends _$Calendar {
  @override
  CalendarModel build(List<HUHabitatModel> habitats) {
    return CalendarModel(
      habitats: habitats,
      habitat: habitats.first,
      loading: true,
    );
  }

  Future<void> loadActions() async {
    try {
      final actions = await Database.myActionsForPastXDays(30);

      final List<int> habitatIds = [];
      for (final habitat in state.habitats) {
        habitatIds.add(habitat.id);
      }

      // Remove any actions from habitats that you left
      actions.removeWhere((action) => !habitatIds.contains(action.habitatId));

      state = state.copyWith(
        actions: actions,
      );
    } on Exception catch (_) {
      state = state.copyWith(error: 'An error occurred', loading: false);
    }
  }

  void setHabitat(HUHabitatModel habitat) =>
      state = state.copyWith(habitat: habitat);
}
