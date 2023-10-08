import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import 'xwidgets.dart';

class HabitatSettingsAdminWidget extends ConsumerWidget {
  const HabitatSettingsAdminWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HabitatSettingsSectionHeaderWidget(
          text: habitatSettingsAdminString,
        ),
        HabitatSettingsSectionWidget(
          children: [
            HabitatSettingsInviteHabitmateRowWidget(habitat: habitat),
            // Text('Set member cap'),
            // Text('Set to private / public'),
          ],
        ),
      ],
    );
  }
}
