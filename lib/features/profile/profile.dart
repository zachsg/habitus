import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../helpers/exceptions.dart';
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

  int daysOld() {
    final today = DateTime.now();
    final createdString = supabase.auth.currentUser?.createdAt ?? '';
    final created = DateTime.parse(createdString);

    final from = DateTime(created.year, created.month, created.day);
    final to = DateTime(today.year, today.month, today.day);

    int difference = (to.difference(from).inHours / 24).round();

    return difference > 0 ? difference : 0;
  }

  Future<void> loadProfile() async {
    try {
      final profile = await Database.profile();
      state = state.copyWith(profile: profile);
    } on Exception catch (_) {}
  }
}
