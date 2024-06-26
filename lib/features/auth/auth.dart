import 'package:mobn/helpers/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../helpers/strings.dart';
import '../../models/xmodels.dart';
import '../../services/database.dart';
import 'auth_model.dart';

part 'auth.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AuthModel build() => AuthModel();

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setHandle(String handle) {
    final handleTrimmed = handle.trim().replaceAll(' ', '');
    state = state.copyWith(handle: handleTrimmed);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setConfirmPassword(String password) {
    if (password != state.password) {
      state = state.copyWith(error: 'Passwords don\'t match');
    } else {
      state = state.copyWith(error: null);
    }

    state = state.copyWith(confirmPassword: password);
  }

  Future<bool> signUp() async {
    state = state.copyWith(loading: true, error: null);

    // Check whether handle is available
    final handleIsAvailable =
        await Database.checkHandleAvailability(state.handle);

    if (handleIsAvailable) {
      // Handle is unique, sign up
      try {
        await supabase.auth.signUp(
          email: state.email,
          password: state.password,
        );
        await _createProfile();
        state = state.copyWith(loading: false);
        return true;
      } on AuthException catch (error) {
        state = state.copyWith(error: error.message, loading: false);
        return false;
      }
    } else {
      state = state.copyWith(loading: false, error: handleIsTakenErrorString);
      return false;
    }
  }

  Future<void> _createProfile() async {
    final id = supabase.auth.currentUser?.id;
    if (id == null) {
      return;
    } else {
      final email = supabase.auth.currentUser?.email ?? '';
      final name = state.name.isNotEmpty
          ? state.name.capitalize()
          : state.handle.capitalize();
      final handle = state.handle;
      final profile = HUProfileModel(
        id: id,
        updatedAt: DateTime.now(),
        email: email,
        name: name,
        handle: handle,
      );
      await Database.createProfile(profile);
    }
  }

  Future<bool> signIn() async {
    state = state.copyWith(loading: true, error: null);

    try {
      await supabase.auth.signInWithPassword(
        email: state.email,
        password: state.password,
      );
      state = state.copyWith(loading: false);
      return true;
    } on AuthException catch (error) {
      state = state.copyWith(error: error.message, loading: false);
      return false;
    }
  }

  void setLoading(bool loading) {
    state = state.copyWith(loading: loading);
  }
}
