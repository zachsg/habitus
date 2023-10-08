import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';
import '../../models/xmodels.dart';
import '../profile/profile.dart';
import 'widgets/xwidgets.dart';

class HabitatSettingsView extends ConsumerWidget {
  const HabitatSettingsView({super.key, required this.habitat});

  final HUHabitatModel habitat;

  static const routeName = 'habitat_settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider).profile;
    final iAmAdmin =
        habitat.creatorId == profile.id || habitat.admins.contains(profile.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text(habitatSettingsTitleString),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (iAmAdmin) HabitatSettingsAdminWidget(habitat: habitat),
            SizedBox(height: iAmAdmin ? 24.0 : 16.0),
            HabitatSettingsMemberWidget(habitat: habitat),
          ],
        ),
      ),
    );
  }
}
