import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../habitat/habitat_view.dart';
import '../habitats.dart';

class HabitatsMyHabitatsWidget extends ConsumerWidget {
  const HabitatsMyHabitatsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitats = ref.watch(habitatsProvider).habitats;

    return ListView.builder(
      itemCount: habitats.length,
      itemBuilder: (context, index) {
        final habitat = habitats[index];

        final DateFormat yesterdayFormmater = DateFormat('MMM d');
        final DateFormat todayFormmater = DateFormat('h:mm a');
        final date = habitat.updatedAt
                .isAfter(DateTime.now().copyWith(hour: 0, minute: 0))
            ? todayFormmater.format(habitat.updatedAt.toLocal())
            : yesterdayFormmater.format(habitat.updatedAt.toLocal());

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Card(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              onTap: () => context.pushNamed(
                HabitatView.routeName,
                pathParameters: {'id': habitat.id.toString()},
                extra: habitat,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 16.0,
                  right: 6.0,
                  bottom: 16.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                habitat.name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                '${habitat.members.length + habitat.admins.length + 1} habitmates',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              date,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.chevron_right,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              size: 28,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
