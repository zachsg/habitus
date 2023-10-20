import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/xmodels.dart';
import '../../services/database.dart';
import '../auth/sign_in_view.dart';
import '../calendar/calendar_view.dart';
import '../habitat/habitat_view.dart';
import '../profile/profile.dart';
import '../profile/profile_view.dart';
import '../settings/settings_view.dart';
import 'habitats.dart';
import 'widgets/xwidgets.dart';

class HabitatsView extends ConsumerStatefulWidget {
  const HabitatsView({super.key});

  static const routeName = '/habitats';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HabitatsViewState();
}

class _HabitatsViewState extends ConsumerState<HabitatsView>
    with WidgetsBindingObserver {
  final isIOS = Platform.isIOS;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      ref.read(profileProvider.notifier).loadProfile();
      ref.read(habitatsProvider.notifier).loadHabitats();
      ref.read(habitatsProvider.notifier).loadActions();
      ref.read(habitatsProvider.notifier).loadCallouts();

      // If the notification contains a habitat, go to the correct habitat
      if (message.data['habitat'] != null) {
        final habitatJson = json.decode(message.data['habitat']);
        final habitat = HUHabitatModel.fromJson(habitatJson);
        context.pushNamed(
          HabitatView.routeName,
          pathParameters: {'id': habitat.id.toString()},
          extra: habitat,
        );
      }
    });

    _watchAuthChanges();

    ref.read(profileProvider.notifier).loadProfile();
    ref.read(habitatsProvider.notifier).loadHabitats();
    ref.read(habitatsProvider.notifier).loadActions();
    ref.read(habitatsProvider.notifier).loadCallouts();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(habitatsProvider.notifier).loadHabitats();
        ref.read(habitatsProvider.notifier).loadActions();
        ref.read(habitatsProvider.notifier).loadCallouts();
        break;
      default:
    }
  }

  void _watchAuthChanges() {
    supabase.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;

      switch (event) {
        case AuthChangeEvent.signedIn:
          context.goNamed(HabitatsView.routeName);
          break;
        case AuthChangeEvent.signedOut:
          context.goNamed(SignInView.routeName);
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(habitatsProvider);
    final profile = ref.watch(profileProvider).profile;

    return profile.acceptedTerms
        ? Scaffold(
            appBar: AppBar(
              title: provider.habitats.isNotEmpty
                  ? IconButton(
                      onPressed: () => context.pushNamed(
                        CalendarView.routeName,
                        extra: provider.habitats,
                      ),
                      icon: const Icon(Icons.roofing),
                    )
                  : null,
              leading: IconButton(
                onPressed: () => context.pushNamed(ProfileView.routeName),
                icon: isIOS
                    ? const Icon(CupertinoIcons.person_alt_circle)
                    : const Icon(Icons.face_outlined),
              ),
              actions: [
                IconButton(
                  onPressed: () => context.pushNamed(SettingsView.routeName),
                  icon: isIOS
                      ? const Icon(CupertinoIcons.settings_solid)
                      : const Icon(Icons.settings),
                ),
              ],
            ),
            body: SafeArea(
              child: provider.loading
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : const HabitatsMyHabitatsWidget(),
            ),
          )
        : const EulaWidget();
  }
}
