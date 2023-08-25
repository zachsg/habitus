import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    } on AuthException catch (error) {
      state = state.copyWith(error: error.message, loading: false);
      return;
    }

    state = state.copyWith(loading: false);

    if (context.mounted) {
      context.goNamed(BottomNavView.routeName);
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
