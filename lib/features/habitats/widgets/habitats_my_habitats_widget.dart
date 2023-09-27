import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../habitat/habitat_view.dart';
import '../habitats.dart';
import 'xwidgets.dart';

class HabitatsMyHabitatsWidget extends ConsumerWidget {
  const HabitatsMyHabitatsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitats = ref.watch(habitatsProvider).habitats;

    return SingleChildScrollView(
      child: Column(
        children: [
          const HabitatsOverallProgressWidget(),
          const SizedBox(height: 8.0),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: habitats.length,
            itemBuilder: (context, index) {
              final habitat = habitats[index];

              final DateFormat yesterdayFormatter = DateFormat('MMM d');
              final DateFormat todayFormatter = DateFormat('h:mm a');
              final date = habitat.updatedAt
                      .isAfter(DateTime.now().copyWith(hour: 0, minute: 0))
                  ? todayFormatter.format(habitat.updatedAt.toLocal())
                  : yesterdayFormatter.format(habitat.updatedAt.toLocal());

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 6.0,
                ),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    onTap: () {
                      context.pushNamed(
                        HabitatView.routeName,
                        pathParameters: {'id': habitat.id.toString()},
                        extra: habitat,
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          habitat.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        Text(
                                          '${habitat.members.length + habitat.admins.length + 1} habitmates',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        date,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
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
                        HabitatsHabitatProgressWidget(habitat: habitat),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 80.0),
        ],
      ),
    );
  }
}
