import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
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
          acceptedTerms: true,
        ),
        loading: true,
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
      state = state.copyWith(profile: profile, loading: false);

      if (profile.pushToken.isEmpty) {
        _firebaseMessagingSetup();
      }
    } on Exception catch (_) {}
  }

  Future<void> acceptTerms() async {
    final date = DateTime.now().toUtc();
    final profile = state.profile.copyWith(
      acceptedTerms: true,
      updatedAt: date,
    );

    state = state.copyWith(profile: profile, loading: true);

    try {
      await Database.acceptEula(state.profile);
    } on Exception catch (_) {}

    state = state.copyWith(loading: false);
  }

  Future<void> savePushToken(String token) async {
    if (state.profile.pushToken == token) {
      return;
    }

    final profile = state.profile.copyWith(pushToken: token);
    state = state.copyWith(profile: profile);

    try {
      await Database.savePushToken(profile);
    } on Exception catch (_) {}
  }

  Future<void> _firebaseMessagingSetup() async {
    // TODO: Request permission
    final messaging = FirebaseMessaging.instance;

    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (kDebugMode) {
      print('Permission granted: ${settings.authorizationStatus}');
    }

    // TODO: Register with FCM
    String? token = await messaging.getToken();
    if (token != null) {
      savePushToken(token);
    }

    if (kDebugMode) {
      print('Registration Token=$token');
    }

    // TODO: Set up foreground message handler
    // TODO: Set up background message handler
  }
}
