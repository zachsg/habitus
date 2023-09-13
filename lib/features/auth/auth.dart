import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/xmodels.dart';
import '../../services/database.dart';
import '../bottom_nav/bottom_nav_view.dart';
import 'auth_model.dart';

part 'auth.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AuthModel build() => AuthModel();

  void setEmail(String email) {
    state = state.copyWith(email: email);
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

  Future<void> signUp(BuildContext context) async {
    state = state.copyWith(loading: true, error: null);

    try {
      await supabase.auth.signUp(
        email: state.email,
        password: state.password,
      );
      await _createProfile();
    } on AuthException catch (error) {
      state = state.copyWith(error: error.message, loading: false);
      return;
    }

    state = state.copyWith(loading: false);

    if (context.mounted) {
      context.goNamed(BottomNavView.routeName);
    }
  }

  Future<void> _createProfile() async {
    final id = supabase.auth.currentUser?.id;
    if (id == null) {
      return;
    } else {
      final email = supabase.auth.currentUser?.email ?? '';
      final name = email.split('@').first;
      final random = Random();
      final randomDigits = '${random.nextInt(10)}${random.nextInt(10)}';
      final handle = '${email.split('@').first}$randomDigits';
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

  Future<void> signIn(BuildContext context) async {
    state = state.copyWith(loading: true, error: null);

    try {
      await supabase.auth.signInWithPassword(
        email: state.email,
        password: state.password,
      );
    } on AuthException catch (error) {
      state = state.copyWith(error: error.message, loading: false);
      return;
    }

    state = state.copyWith(loading: false);

    if (context.mounted) {
      context.goNamed(BottomNavView.routeName);
    }
  }

  void setLoading(bool loading) {
    state = state.copyWith(loading: loading);
  }
}
