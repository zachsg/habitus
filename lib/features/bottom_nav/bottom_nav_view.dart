import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';
import '../habitats/habitats.dart';
import '../profile/profile.dart';
import '../profile/profile_view.dart';
import '../settings/settings_view.dart';
import '../habitats/habitats_view.dart';
import 'bottom_nav.dart';
import 'widgets/xwidgets.dart';

class BottomNavView extends ConsumerStatefulWidget {
  const BottomNavView({super.key});

  static const routeName = '/bottom_nav';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends ConsumerState<BottomNavView>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    ref.read(profileProvider.notifier).loadProfile();

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(habitatsProvider.notifier).loadHabitats();
        ref.read(habitatsProvider.notifier).loadActions();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(bottomNavProvider).index;
    final isIOS = Platform.isIOS;

    final profile = ref.watch(profileProvider).profile;

    final body = index == 0
        ? const ProfileView()
        : index == 1
            ? const HabitatsView()
            : const SettingsView();

    return Scaffold(
      body: profile.acceptedTerms ? body : const EulaWidget(),
      bottomNavigationBar: profile.acceptedTerms
          ? NavigationBar(
              onDestinationSelected: (int index) =>
                  ref.read(bottomNavProvider.notifier).setPage(index),
              selectedIndex: ref.watch(bottomNavProvider).index,
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              destinations: [
                NavigationDestination(
                  selectedIcon: isIOS
                      ? const Icon(CupertinoIcons.person_alt_circle_fill)
                      : const Icon(Icons.face),
                  icon: isIOS
                      ? const Icon(CupertinoIcons.person_alt_circle)
                      : const Icon(Icons.face_outlined),
                  label: profileTitleString,
                ),
                NavigationDestination(
                  selectedIcon: isIOS
                      ? const Icon(CupertinoIcons.group_solid)
                      : const Icon(Icons.group),
                  icon: isIOS
                      ? const Icon(CupertinoIcons.group)
                      : const Icon(Icons.group_outlined),
                  label: homeTitleString,
                ),
                NavigationDestination(
                  selectedIcon: isIOS
                      ? const Icon(CupertinoIcons.settings_solid)
                      : const Icon(Icons.settings),
                  icon: isIOS
                      ? const Icon(CupertinoIcons.settings)
                      : const Icon(Icons.settings_outlined),
                  label: settingsTitleString,
                ),
              ],
            )
          : null,
    );
  }
}
