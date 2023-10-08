import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/extensions.dart';
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

    return ListView.builder(
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
              onPressed: () async {
                await ref
                    .read(habitatSettingsProvider(habitat).notifier)
                    .invite(match);

                final message =
                    'Successfully added @${match.handle} to ${habitat.name}';

                if (context.mounted) {
                  context.showSnackBar(message: message);
                }
              },
              child: const Text('Invite'),
            ),
          );
        }
      },
    );
  }
}
