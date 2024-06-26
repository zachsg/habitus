// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeHash() => r'a41fd13c011c750bbbfc8541ec6c27563e846bd3';

/// See also [theme].
@ProviderFor(theme)
final themeProvider = AutoDisposeProvider<ThemeService>.internal(
  theme,
  name: r'themeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$themeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ThemeRef = AutoDisposeProviderRef<ThemeService>;
String _$prefsHash() => r'f5576eebaa1f1a9d12d10ecb4eb691a94c3d6182';

/// See also [prefs].
@ProviderFor(prefs)
final prefsProvider = AutoDisposeProvider<SharedPreferences>.internal(
  prefs,
  name: r'prefsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$prefsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PrefsRef = AutoDisposeProviderRef<SharedPreferences>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
