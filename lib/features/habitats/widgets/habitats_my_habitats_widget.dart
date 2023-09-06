import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../habitat/habitat_view.dart';
import '../habitats.dart';
import 'xwidgets.dart';

class HabitatsMyHabitatsWidget extends ConsumerWidget {
  const HabitatsMyHabitatsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitats = ref.watch(habitatsProvider).habitats;

    return ListView.builder(
      itemCount: habitats.length,
      itemBuilder: (context, index) {
        final habitat = habitats[index];

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () => context.pushNamed(
              HabitatView.routeName,
              pathParameters: {'id': habitat.id.toString()},
              extra: habitat,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          habitat.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const HabitatsTakeActionButtonWidget(),
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
