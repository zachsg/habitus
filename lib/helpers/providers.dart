import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/theme_service.dart';

part 'providers.g.dart';

@riverpod
ThemeService theme(ThemeRef ref) {
  final prefs = ref.watch(prefsProvider);
  return ThemeService(prefs, ThemeMode.system);
}

@riverpod
SharedPreferences prefs(PrefsRef ref) => throw UnimplementedError();
