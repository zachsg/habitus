import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../helpers/strings.dart';
import '../../services/database.dart';
import '../profile/profile.dart';
import 'settings_model.dart';

part 'settings.g.dart';

@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  @override
  SettingsModel build() =>
      SettingsModel(profile: ref.read(profileProvider).profile);

  Future<void> loadProfile() async {
    try {
      final profile = await Database.profile();
      state = state.copyWith(profile: profile);
    } on Exception catch (_) {}
  }

  void signOut() => supabase.auth.signOut();

  Future<bool> deleteAccount() async {
    state = state.copyWith(loading: true);

    final profile = ref.read(profileProvider).profile;

    final success = await Database.deleteAccount(profile.id);

    if (success) {
      state = state.copyWith(loading: false);
      return true;
    } else {
      state = state.copyWith(loading: false, error: genericErrorString);
      return false;
    }
  }

  void setName(String name) {
    final updatedAt = DateTime.now();
    final profile = state.profile.copyWith(updatedAt: updatedAt, name: name);
    state = state.copyWith(profile: profile);
  }

  Future<bool> saveName() async {
    state = state.copyWith(loading: true);

    final success = await Database.saveProfileName(state.profile);

    state = state.copyWith(loading: false);

    if (success) {
      state = state.copyWith(error: null);
      return true;
    } else {
      state = state.copyWith(error: nameErrorString);
      return false;
    }
  }

  void setHandle(String handle) {
    final updatedAt = DateTime.now();
    final profile = state.profile.copyWith(
      updatedAt: updatedAt,
      handle: handle,
    );
    state = state.copyWith(profile: profile);
  }

  Future<bool> saveHandle() async {
    state = state.copyWith(loading: true);

    final success = await Database.saveProfileHandle(state.profile);

    state = state.copyWith(loading: false);

    if (success) {
      state = state.copyWith(error: null);
      return true;
    } else {
      state = state.copyWith(error: handleErrorString);
      return false;
    }
  }

  void setBio(String bio) {
    final updatedAt = DateTime.now();
    final profile = state.profile.copyWith(updatedAt: updatedAt, bio: bio);
    state = state.copyWith(profile: profile);
  }

  Future<bool> saveBio() async {
    state = state.copyWith(loading: true);

    final success = await Database.saveProfileBio(state.profile);

    state = state.copyWith(loading: false);

    if (success) {
      state = state.copyWith(error: null);
      return true;
    } else {
      state = state.copyWith(error: bioErrorString);
      return false;
    }
  }

  void setMinimalTimer(bool isMinimal) {
    state = state.copyWith(minimalTimer: isMinimal);
  }
}
