import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'xwidgets.dart';

class JoinHabitatJoinWidget extends ConsumerWidget {
  const JoinHabitatJoinWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Column(
              children: [
                JoinHabitatDropdownButtonWidget(),
                SizedBox(height: 32),
                JoinHabitatGoalWidget(),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.0),
        Column(
          children: [
            JoinHabitatShowHabitatsButtonWidget(),
            SizedBox(height: 12),
            Divider(),
            SizedBox(height: 12),
            JoinHabitatAvailableHabitatsWidget(),
          ],
        )
      ],
    );
  }
}
