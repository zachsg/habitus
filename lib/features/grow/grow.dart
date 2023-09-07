import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/xmodels.dart';
import 'grow_model.dart';

part 'grow.g.dart';

@riverpod
class Grow extends _$Grow {
  @override
  GrowModel build(HUHabitatModel habitat) => GrowModel(
        habitat: habitat,
        loading: true,
      );

  void setElapsed(int elapsed) {
    state = state.copyWith(elapsed: elapsed);
  }

  void setPaused(bool paused) {
    state = state.copyWith(isPaused: paused);
  }
}
