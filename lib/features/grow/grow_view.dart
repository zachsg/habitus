import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/xmodels.dart';
import '../../helpers/strings.dart';
import 'grow.dart';

class GrowView extends ConsumerWidget {
  const GrowView({super.key, required this.habitat});

  final HUHabitatModel habitat;

  static const routeName = 'grow';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(takeActionString),
      ),
      body: Center(
        child: Text(ref.watch(growProvider(habitat)).habitat.name),
      ),
    );
  }
}
