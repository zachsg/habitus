import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../../habitats/habitats_view.dart';
import '../habitat_settings.dart';

class HabitatSettingsLeaveRowWidget extends ConsumerWidget {
  const HabitatSettingsLeaveRowWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitatSettingsP = ref.watch(habitatSettingsProvider(habitat));

    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(habitatSettingsLeaveDialogTitleString),
              content: StatefulBuilder(builder: (context, setState) {
                return const Text(habitatSettingsLeaveDialogBodyString);
              }),
              actions: [
                habitatSettingsP.loading
                    ? const CircularProgressIndicator.adaptive()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: context.pop,
                            child: Text(
                              habitatSettingsLeaveNoString,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              // TODO: Handle leaving of habitat by user
                              await ref
                                  .read(
                                      habitatSettingsProvider(habitat).notifier)
                                  .leaveHabitat();

                              if (context.mounted) {
                                context.goNamed(HabitatsView.routeName);
                              }
                            },
                            child: Text(
                              habitatSettingsLeaveYesString,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
              ],
            );
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            habitatSettingsLeaveString,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.error),
          ),
        ],
      ),
    );
  }
}
