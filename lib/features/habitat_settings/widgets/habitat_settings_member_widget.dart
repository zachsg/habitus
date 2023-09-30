import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import 'xwidgets.dart';

class HabitatSettingsMemberWidget extends ConsumerWidget {
  const HabitatSettingsMemberWidget({super.key});

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
            Row(),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text('Coming Soon'),
            ),
          ],
        ),
      ],
    );
  }
}
