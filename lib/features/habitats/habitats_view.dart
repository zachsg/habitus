import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';
import 'habitats.dart';
import 'widgets/xwidgets.dart';

class HabitatsView extends ConsumerWidget {
  const HabitatsView({super.key});

  static const routeName = 'habitats';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(habitatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(homeTitleString),
      ),
      body: SafeArea(
        child: provider.loading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : provider.habitats.isEmpty
                ? const HabitatsEmptyStateWidget()
                : const HabitatsMyHabitatsWidget(),
      ),
    );
  }
}
