import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../habitat/habitat_view.dart';
import '../../join_habitat/join_habitat_view.dart';
import '../habitats.dart';
import 'xwidgets.dart';

class HabitatsMyHabitatsWidget extends ConsumerWidget {
  const HabitatsMyHabitatsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitats = ref.watch(habitatsProvider).habitats;
    final isIOS = Platform.isIOS;

    return SingleChildScrollView(
      child: Column(
        children: [
          const HabitatsOverallProgressWidget(),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: habitats.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 4.0,
                  crossAxisCount: 2,
                  childAspectRatio: 0.80),
              itemBuilder: (context, index) {
                if (index == habitats.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Card(
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        onTap: () =>
                            context.pushNamed(JoinHabitatView.routeName),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            isIOS
                                ? CupertinoIcons.add_circled
                                : Icons.add_circle,
                            color: Theme.of(context).colorScheme.primary,
                            size: 96.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  final habitat = habitats[index];

                  final DateFormat yesterdayFormatter = DateFormat('MMM d');
                  final DateFormat todayFormatter = DateFormat('h:mm a');
                  final date = habitat.updatedAt
                          .isAfter(DateTime.now().copyWith(hour: 0, minute: 0))
                      ? todayFormatter.format(habitat.updatedAt.toLocal())
                      : yesterdayFormatter.format(habitat.updatedAt.toLocal());

                  return Padding(
                    padding: EdgeInsets.only(
                      top: index == 0 || index == 1 ? 0.0 : 2.0,
                      bottom: index == habitats.length - 1 ? 0.0 : 2.0,
                    ),
                    child: Card(
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        onTap: () {
                          context.pushNamed(
                            HabitatView.routeName,
                            pathParameters: {'id': habitat.id.toString()},
                            extra: habitat,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                right: 0,
                                left: 0,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 8.0),
                                    HabitatsHabitatProgressWidget(
                                        habitat: habitat),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      habitat.name,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '${habitat.members.length + habitat.admins.length + 1}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Icon(
                                          isIOS
                                              ? CupertinoIcons.group_solid
                                              : Icons.group,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer,
                                        )
                                      ],
                                    ),
                                    Text(
                                      date,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
