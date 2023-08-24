import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';

class TeamsView extends ConsumerWidget {
  const TeamsView({super.key});

  static const routeName = '/teams';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(teamsTitleString),
      ),
      body: const SafeArea(
        child: Center(
          child: Text(teamsTitleString),
        ),
      ),
    );
  }
}
