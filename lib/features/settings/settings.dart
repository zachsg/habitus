import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/database.dart';
import '../auth/sign_in_view.dart';
import '../profile/profile.dart';
import 'settings_model.dart';

part 'settings.g.dart';

@riverpod
class Settings extends _$Settings {
  @override
  SettingsModel build() =>
      SettingsModel(profile: ref.read(profileProvider).profile);

  void signOut(BuildContext context) {
    supabase.auth.signOut();
    context.goNamed(SignInView.routeName);
  }

  void setName(String name) {
    final profile = state.profile.copyWith(name: name);
    state = state.copyWith(profile: profile);
  }

  void setHandle(String handle) {
    final profile = state.profile.copyWith(handle: handle);
    state = state.copyWith(profile: profile);
  }

  void setBio(String bio) {
    final profile = state.profile.copyWith(bio: bio);
    state = state.copyWith(profile: profile);
  }
}
