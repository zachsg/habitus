import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/xmodels.dart';

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
    // TODO: Load team

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.team.name),
      ),
    );
  }
}
