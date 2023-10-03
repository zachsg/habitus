import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';
import 'join_habitat.dart';
import 'widgets/xwidgets.dart';

class JoinHabitatView extends ConsumerWidget {
  const JoinHabitatView({super.key});

  static const routeName = 'join_habitat';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final joinHabitat = ref.watch(joinHabitatProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(joinHabitatTitleString),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const JoinHabitatIsJoiningToggleWidget(),
              const SizedBox(height: 16.0),
              joinHabitat.isJoining
                  ? const JoinHabitatJoinWidget()
                  : const JoinHabitatMakeWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
