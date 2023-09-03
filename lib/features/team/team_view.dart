import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/constants.dart';
import '../../helpers/strings.dart';
import '../../models/xmodels.dart';
import 'team.dart';
import 'widgets/xwidget.dart';

class TeamView extends ConsumerStatefulWidget {
  const TeamView({super.key, required this.team});

  final HUTeamModel team;

  static const routeName = 'team';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeamViewState();
}

class _TeamViewState extends ConsumerState<TeamView> {
  @override
  void initState() {
    ref.read(teamProvider(widget.team).notifier).loadProfiles();
    ref.read(teamProvider(widget.team).notifier).loadActions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.team.name),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const PieChartSample3(),
              const SizedBox(height: 8.0),
              TeamTeammatesWidget(team: widget.team),
              const SizedBox(height: 32.0),
              TeamActivityWidget(team: widget.team),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Start timer and show timer view
        },
        label: Row(
          children: [
            const Text(takeActionString),
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
