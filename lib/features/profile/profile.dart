import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/xmodels.dart';
import '../../services/database.dart';
import '../auth/sign_in_view.dart';
import 'profile_model.dart';

part 'profile.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  ProfileModel build() => ProfileModel(
      profile: HUProfileModel(id: supabase.auth.currentUser?.id ?? ''));

  void signOut(BuildContext context) {
    supabase.auth.signOut();
    context.goNamed(SignInView.routeName);
  }
}
