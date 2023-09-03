import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../helpers/constants.dart';
import '../../helpers/strings.dart';
import '../join_team/join_team_view.dart';
import 'home.dart';
import 'widgets/xwidgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    ref.read(homeProvider.notifier).loadTeams();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(homeProvider).loading;
    final teams = ref.watch(homeProvider).teams;

    return Scaffold(
      appBar: AppBar(
        title: const Text(homeTitleString),
      ),
      body: SafeArea(
        child: loading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : teams.isEmpty
                ? const HomeEmptyStateWidget()
                : const HomeMyTeamsWidget(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNamed(JoinTeamView.routeName),
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
