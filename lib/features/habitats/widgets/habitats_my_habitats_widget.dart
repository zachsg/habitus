import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobn/helpers/extensions.dart';

import '../../habitat/habitat_view.dart';
import '../../join_habitat/join_habitat_view.dart';
import '../../profile/profile.dart';
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: habitats.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 4.0,
                crossAxisCount: 2,
                childAspectRatio: 0.82,
              ),
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

                  final date = habitat.updatedAt
                          .isAfter(DateTime.now().copyWith(hour: 0, minute: 0))
                      ? habitat.updatedAt.toLocal().friendly()
                      : habitat.updatedAt.toLocal().friendlyYesterday();

                  bool calledOut = false;
                  final profile = ref.watch(profileProvider).profile;
                  for (final callout in ref.watch(habitatsProvider).callouts) {
                    if (callout.callee == profile.id &&
                        habitat.id == callout.habitatId) {
                      calledOut = true;
                      break;
                    }
                  }

                  return Padding(
                    padding: EdgeInsets.only(
                      top: index == 0 || index == 1 ? 0.0 : 2.0,
                      bottom: index == habitats.length - 1 ? 0.0 : 2.0,
                    ),
                    child: Stack(
                      children: [
                        Card(
                          color: calledOut
                              ? Theme.of(context).colorScheme.errorContainer
                              : null,
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
                                    top: 24,
                                    right: 0,
                                    left: 0,
                                    child: Column(
                                      children: [
                                        HabitatsHabitatProgressWidget(
                                          habitat: habitat,
                                        ),
                                        const SizedBox(height: 12.0),
                                        Text(
                                          habitat.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        const SizedBox(height: 12.0),
                                        HabitatsPastWeekWidget(
                                          habitat: habitat,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
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
                                                  .bodySmall,
                                            ),
                                            const SizedBox(width: 4.0),
                                            Icon(
                                              isIOS
                                                  ? CupertinoIcons.group_solid
                                                  : Icons.group,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer,
                                              size: 18.0,
                                            )
                                          ],
                                        ),
                                        Text(
                                          date,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        calledOut
                            ? Positioned(
                                top: -4.0,
                                left: -4.0,
                                child: Icon(
                                  Icons.report,
                                  color: Theme.of(context).colorScheme.error,
                                  size: 32.0,
                                ),
                              )
                            : const SizedBox(),
                      ],
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
