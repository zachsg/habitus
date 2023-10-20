import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/xmodels.dart';
import 'calendar.dart';
import 'widgets/xwidgets.dart';

class CalendarView extends ConsumerStatefulWidget {
  const CalendarView({super.key, required this.habitats});

  final List<HUHabitatModel> habitats;

  static const routeName = 'calendar';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarViewState();
}

class _CalendarViewState extends ConsumerState<CalendarView> {
  @override
  void initState() {
    ref.read(calendarProvider(widget.habitats).notifier).loadActions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(calendarProvider(widget.habitats));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Progress',
        ),
      ),
      body: Column(
        children: [
          CalendarHabitatPickerWidget(habitats: widget.habitats),
          provider.actions.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: provider.actions.length,
                    itemBuilder: (context, index) {
                      final action = provider.actions[index];
                      final habitat = provider.habitats.firstWhere(
                          (habitat) => habitat.id == action.habitatId);

                      if (action.habitatId == provider.habitat.id) {
                        return ListTile(
                          title: Text(action.createdAt.toLocal().toString()),
                          subtitle: Text(habitat.name),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                )
              : const CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }
}
