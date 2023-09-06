import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';
import 'widgets/xwidgets.dart';

class JoinHabitatView extends ConsumerWidget {
  const JoinHabitatView({super.key});

  static const routeName = 'join_habitat';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(joinHabitatTitleString),
      ),
      body: const SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          child: Column(
            children: [
              JoinHabitatDropdownButtonWidget(),
              SizedBox(height: 32),
              JoinHabitatGoalWidget(),
              SizedBox(height: 32),
              JoinHabitatShowHabitatsButtonWidget(),
              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),
              JoinHabitatAvailableHabitatsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
