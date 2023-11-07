import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobn/helpers/extensions.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../habitat_settings.dart';
import 'xwidgets.dart';

class HabitatSettingsGoalRowWidget extends ConsumerWidget {
  const HabitatSettingsGoalRowWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(habitatSettingsProvider(habitat)).profile;
    final goal =
        profile.goals.firstWhere((goal) => goal.habitatId == habitat.id);

    return TextButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return HabitatSettingsBottomSheetWidget(
              title: editNameGoalString,
              onPressed: () async {
                await ref
                    .read(habitatSettingsProvider(habitat).notifier)
                    .saveNewGoal();

                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              secondaryAction: ref
                  .read(habitatSettingsProvider(habitat).notifier)
                  .cancelGoalEdits,
              habitat: habitat,
              child: HabitatSettingsGoalWidget(habitat: habitat),
            );
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            joinHabitatGoalString,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  goal.value.toTimeLong(),
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
