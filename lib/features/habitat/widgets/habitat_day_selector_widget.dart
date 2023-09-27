import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../habitat.dart';

class HabitatDaySelectorWidget extends ConsumerWidget {
  const HabitatDaySelectorWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateFormat formatter = DateFormat('MMM d');
    final formattedDate = formatter.format(ref.watch(habitatProvider(habitat)).day.toLocal());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed:
              ref.read(habitatProvider(habitat).notifier).previousDay,
          child: const Text(prevString),
        ),
        const SizedBox(width: 12.0),
        Text(
          formattedDate,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(width: 12.0),
        ElevatedButton(
          onPressed: ref.read(habitatProvider(habitat).notifier).resetDay,
          child: const Text(todayString),
        ),
      ],
    );
  }
}
