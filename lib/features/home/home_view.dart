import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';
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
                : Center(child: Text(teams.first.name)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          children: [
            const Text(newHabitString),
            const SizedBox(width: 4),
            Icon(Platform.isIOS ? CupertinoIcons.add : Icons.add),
          ],
        ),
      ),
    );
  }
}
