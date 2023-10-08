import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../habitat_settings.dart';
import 'xwidgets.dart';

class HabitatSettingsInviteHabitmateRowWidget extends ConsumerWidget {
  const HabitatSettingsInviteHabitmateRowWidget({
    super.key,
    required this.habitat,
  });

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return HabitatSettingsBottomSheetWidget(
              title: habitatSettingsInviteString,
              onPressed: () async {
                Navigator.of(context).pop();
              },
              secondaryAction: () async {
                ref
                    .read(habitatSettingsProvider(habitat).notifier)
                    .clearPossibleInvites();
              },
              actionText: 'Close',
              habitat: habitat,
              child: HabitatSettingsInviteHabitmateWidget(habitat: habitat),
            );
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            habitatSettingsInviteString,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 4),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
