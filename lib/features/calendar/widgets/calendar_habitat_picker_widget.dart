import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/xmodels.dart';
import '../calendar.dart';

class CalendarHabitatPickerWidget extends ConsumerWidget {
  const CalendarHabitatPickerWidget({super.key, required this.habitats});

  final List<HUHabitatModel> habitats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(calendarProvider(habitats));

    return SizedBox(
      height: 64.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: provider.habitats.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final habitat = provider.habitats[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text(habitat.name),
              selected: provider.habitat.id == habitat.id,
              onSelected: (bool selected) => ref
                  .read(calendarProvider(habitats).notifier)
                  .setHabitat(habitat),
            ),
          );
        },
      ),
    );
  }
}
