import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/xmodels.dart';
import 'xwidgets.dart';

class HabitatSettingsInviteHabitmateWidget extends ConsumerWidget {
  const HabitatSettingsInviteHabitmateWidget({
    super.key,
    required this.habitat,
  });

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        HabitatSettingsSearchHabitmateWidget(habitat: habitat),
        HabitatSettingsPossibleHabitmatesWidget(habitat: habitat),
      ],
    );
  }
}
