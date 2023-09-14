import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/theme_service.dart';

part 'providers.g.dart';

@riverpod
ThemeService themeService(ThemeServiceRef ref) {
  final prefs = ref.read(prefsProvider);
  return ThemeService(prefs);
}

// Override in `Provider Container` when app starts.
@riverpod
SharedPreferences prefs(PrefsRef ref) => throw UnimplementedError();
