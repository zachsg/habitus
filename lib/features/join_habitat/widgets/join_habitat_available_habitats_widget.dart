import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../join_habitat.dart';

class JoinHabitatAvailableHabitatsWidget extends ConsumerWidget {
  const JoinHabitatAvailableHabitatsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(joinHabitatProvider).loading;
    final habitats = ref.watch(joinHabitatProvider).habitats;
    final error = ref.watch(joinHabitatProvider).error;

    return error != null && habitats.isEmpty
        ? Center(child: Text(error))
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: habitats.length,
            itemBuilder: (context, index) {
              final habitat = habitats[index];

              return ListTile(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                title: Text(habitat.name),
                subtitle: Text(
                  habitat.admins.isEmpty
                      ? '${habitat.admins.length + habitat.members.length + 1} members'
                      : '${habitat.admins.length + habitat.members.length + 1} members (${habitat.admins.length} ${habitat.admins.length == 1 ? 'is an admin' : 'are admins'})',
                ),
                trailing: loading
                    ? const CircularProgressIndicator.adaptive()
                    : FilledButton(
                        child: const Text(joinHabitatsString),
                        onPressed: () => ref
                            .read(joinHabitatProvider.notifier)
                            .joinHabitat(context, habitat),
                      ),
              );
            },
          );
  }
}
