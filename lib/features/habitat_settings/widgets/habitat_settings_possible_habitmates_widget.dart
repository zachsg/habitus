import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/xmodels.dart';
import '../habitat_settings.dart';

class HabitatSettingsPossibleHabitmatesWidget extends ConsumerWidget {
  const HabitatSettingsPossibleHabitmatesWidget({
    super.key,
    required this.habitat,
  });

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitatSettingsP = ref.watch(habitatSettingsProvider(habitat));

    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: habitatSettingsP.possibleInvites.length,
          itemBuilder: (context, index) {
            if (habitatSettingsP.loading) {
              return const CircularProgressIndicator.adaptive();
            } else if (habitatSettingsP.possibleInvites.isEmpty) {
              return const Text('No matches found.');
            } else {
              final match = habitatSettingsP.possibleInvites[index];

              return ListTile(
                title: Text(match.name),
                subtitle: Text('@${match.handle}'),
                trailing: FilledButton(
                  onPressed: () => ref
                      .read(habitatSettingsProvider(habitat).notifier)
                      .invite(match),
                  child: const Text('Invite'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
