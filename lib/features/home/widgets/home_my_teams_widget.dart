import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../team/team_view.dart';
import '../home.dart';

class HomeMyTeamsWidget extends ConsumerWidget {
  const HomeMyTeamsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teams = ref.watch(homeProvider).teams;

    return ListView.builder(
      itemCount: teams.length,
      itemBuilder: (context, index) {
        final team = teams[index];

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () => context.pushNamed(
              TeamView.routeName,
              pathParameters: {'id': team.id.toString()},
              extra: team,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      team.name,
                      style: Theme.of(context).textTheme.titleMedium,
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
