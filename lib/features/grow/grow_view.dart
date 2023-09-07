import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/xmodels.dart';
import '../../helpers/strings.dart';
import '../profile/profile.dart';
import 'grow.dart';
import 'widgets/xwidgets.dart';

class GrowView extends ConsumerWidget {
  const GrowView({super.key, required this.habitat});

  final HUHabitatModel habitat;

  static const routeName = 'grow';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider).profile;

    return Scaffold(
      appBar: AppBar(
        title: Text(_habitType()),
      ),
      body: Column(
        children: [
          GrowTimerWidget(
            profile: profile,
            habitat: habitat,
            finished: () {},
          ),
          ElevatedButton(
            onPressed: () =>
                ref.read(growProvider(habitat).notifier).setPaused(true),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              child: Text('$pauseString ${_habitType()}'),
            ),
          ),
        ],
      ),
    );
  }

  String _habitType() {
    switch (habitat.goal.habit) {
      case 'Read':
        return 'Reading';
      case 'Exercise':
        return 'Exercising';
      case 'Meditate':
        return 'Meditating';
      default:
        return 'Growing';
    }
  }
}
