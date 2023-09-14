import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../habitat.dart';

class HabitatEmptyStateWidget extends ConsumerWidget {
  const HabitatEmptyStateWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitat = ref.watch(habitatProvider(this.habitat));
    final DateFormat formatter = DateFormat('MMM d');
    final formattedDate = formatter.format(habitat.day.toLocal());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        '$emptyHabitString $formattedDate',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
