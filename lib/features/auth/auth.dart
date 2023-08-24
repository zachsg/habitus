import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setConfirmPassword(String password) {
    state = state.copyWith(confirmPassword: password);
  }

  Future<void> signUp() async {
    state = state.copyWith(loading: true);

    await supabase.auth.signUp(
      email: state.email,
      password: state.password,
    );

    state = state.copyWith(loading: false);
  }

  Future<void> signIn() async {
    state = state.copyWith(loading: true);

    await supabase.auth.signInWithPassword(
      email: state.email,
      password: state.password,
    );

    state = state.copyWith(loading: false);
  }

  void setLoading(bool loading) {
    state = state.copyWith(loading: loading);
  }
}
