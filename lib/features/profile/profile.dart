import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/xmodels.dart';
import '../../services/database.dart';
import 'profile_model.dart';

part 'profile.g.dart';

@Riverpod(keepAlive: true)
class Profile extends _$Profile {
  @override
  ProfileModel build() => ProfileModel(
        profile: HUProfileModel(
          id: supabase.auth.currentUser?.id ?? '',
          updatedAt: DateTime.now(),
        ),
      );

  Future<void> updateProfile() async {
    final profile = state.profile.copyWith(
      updatedAt: DateTime.now(),
      name: 'zach',
      email: supabase.auth.currentUser?.email ?? '',
      handle: 'zachhandle',
      bio: 'This is my bio for you to read about and whatnot',
    );

    state = state.copyWith(profile: profile);

    state = state.copyWith(loading: true);

    await Database.updateProfile(profile);

    state = state.copyWith(loading: false);
  }
}
