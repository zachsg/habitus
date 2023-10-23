import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobn/helpers/extensions.dart';

import '../../../models/xmodels.dart';
import '../calendar.dart';

class CalendarMonthPickerWidget extends ConsumerWidget {
  const CalendarMonthPickerWidget({super.key, required this.habitats});

  final List<HUHabitatModel> habitats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(calendarProvider(habitats));

    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: ref.read(calendarProvider(habitats).notifier).prevMonth,
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const SizedBox(width: 12.0),
          Text(
            provider.date.month.toMonthLong(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(width: 12.0),
          IconButton(
            onPressed: ref.read(calendarProvider(habitats).notifier).nextMonth,
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
