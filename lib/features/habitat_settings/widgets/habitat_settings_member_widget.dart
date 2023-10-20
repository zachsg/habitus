import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobn/models/h_u_habitat_model.dart';

import '../../../helpers/strings.dart';
import 'xwidgets.dart';

class HabitatSettingsMemberWidget extends ConsumerWidget {
  const HabitatSettingsMemberWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HabitatSettingsSectionHeaderWidget(
          text: habitatSettingsMemberString,
        ),
        HabitatSettingsSectionWidget(
          children: [
            HabitatSettingsGoalRowWidget(habitat: habitat),
            const HabitatSettingsSectionDividerWidget(),
            HabitatSettingsLeaveRowWidget(habitat: habitat),
          ],
        ),
      ],
    );
  }
}
