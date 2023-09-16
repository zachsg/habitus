import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/theme_service.dart';

part 'providers.g.dart';

@riverpod
ThemeService theme(ThemeRef ref) {
  final prefs = ref.read(prefsProvider);
  return ThemeService(prefs);
}

@riverpod
SharedPreferences prefs(PrefsRef ref) => throw UnimplementedError();
