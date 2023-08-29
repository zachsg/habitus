import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../helpers/strings.dart';
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

  Future<void> saveName(BuildContext context) async {
    state = state.copyWith(loading: true);

    final success = await Database.saveProfileName(state.profile.name);

    state = state.copyWith(loading: false);

    if (success) {
      state = state.copyWith(error: null);
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } else {
      state = state.copyWith(error: nameErrorString);
    }
  }

  void setHandle(String handle) {
    final profile = state.profile.copyWith(handle: handle);
    state = state.copyWith(profile: profile);
  }

  Future<void> saveHandle(BuildContext context) async {
    state = state.copyWith(loading: true);

    final success = await Database.saveProfileHandle(state.profile.handle);

    state = state.copyWith(loading: false);

    if (success) {
      state = state.copyWith(error: null);

      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } else {
      state = state.copyWith(error: handleErrorString);
    }
  }

  void setBio(String bio) {
    final profile = state.profile.copyWith(bio: bio);
    state = state.copyWith(profile: profile);
  }

  Future<void> saveBio(BuildContext context) async {
    state = state.copyWith(loading: true);

    final success = await Database.saveProfileBio(state.profile.bio);

    state = state.copyWith(loading: false);

    if (success) {
      state = state.copyWith(error: null);

      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } else {
      state = state.copyWith(error: bioErrorString);
    }
  }
}
