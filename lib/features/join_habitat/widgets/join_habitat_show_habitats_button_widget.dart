import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../join_habitat.dart';

class JoinHabitatShowHabitatsButtonWidget extends ConsumerWidget {
  const JoinHabitatShowHabitatsButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(joinHabitatProvider).loading;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        loading
            ? const SizedBox(
                height: 48,
                child: CircularProgressIndicator.adaptive(),
              )
            : ElevatedButton(
                onPressed:
                    ref.read(joinHabitatProvider.notifier).findMatchingHabitats,
                child: const Text(showHabitatsString),
              ),
      ],
    );
  }
}
