import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'bottom_nav_model.dart';

part 'bottom_nav.g.dart';

@riverpod
class BottomNav extends _$BottomNav {
  @override
  BottomNavModel build() => BottomNavModel();

  void setPage(int index) => state = state.copyWith(index: index);
}
