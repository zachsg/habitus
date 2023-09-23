import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../helpers/constants.dart';
import '../../helpers/strings.dart';
import '../join_habitat/join_habitat_view.dart';
import 'habitats.dart';
import 'widgets/xwidgets.dart';

class HabitatsView extends ConsumerStatefulWidget {
  const HabitatsView({super.key});

  static const routeName = 'habitats';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HabitatsView> {
  @override
  void initState() {
    ref.read(habitatsProvider.notifier).loadHabitats();
    ref.read(habitatsProvider.notifier).loadActions();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(habitatsProvider).loading;
    final habitats = ref.watch(habitatsProvider).habitats;

    return Scaffold(
      appBar: AppBar(
        title: const Text(homeTitleString),
      ),
      body: SafeArea(
        child: loading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : habitats.isEmpty
                ? const HabitatsEmptyStateWidget()
                : const HabitatsMyHabitatsWidget(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNamed(JoinHabitatView.routeName),
        label: Row(
          children: [
            const Text(newHabitString),
            const SizedBox(width: 8),
            SvgPicture.asset(
              habitusLogoSvg,
              semanticsLabel: habitusLogoString,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.onPrimaryContainer,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
