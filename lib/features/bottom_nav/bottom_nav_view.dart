import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';
import '../profile/profile_view.dart';
import '../settings/settings_view.dart';
import '../teams/teams_view.dart';
import 'bottom_nav.dart';

class BottomNavView extends ConsumerWidget {
  const BottomNavView({super.key});

  static const routeName = '/bottom_nav';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavProvider).index;
    final isIOS = Platform.isIOS;

    final body = index == 0
        ? const TeamsView()
        : index == 1
            ? const ProfileView()
            : const SettingsView();

    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) =>
            ref.read(bottomNavProvider.notifier).setPage(index),
        selectedIndex: ref.watch(bottomNavProvider).index,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(
            selectedIcon: isIOS
                ? const Icon(CupertinoIcons.group_solid)
                : const Icon(Icons.group),
            icon: isIOS
                ? const Icon(CupertinoIcons.group)
                : const Icon(Icons.group_outlined),
            label: teamsTitleString,
          ),
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
                ? const Icon(CupertinoIcons.settings_solid)
                : const Icon(Icons.settings),
            icon: isIOS
                ? const Icon(CupertinoIcons.settings)
                : const Icon(Icons.settings_outlined),
            label: settingsTitleString,
          ),
        ],
      ),
    );
  }
}
