import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';
import 'widgets/xwidgets.dart';

class JoinTeamView extends ConsumerWidget {
  const JoinTeamView({super.key});

  static const routeName = 'join_team';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(joinTeamTitleString),
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
              JoinTeamDropdownButtonWidget(),
              SizedBox(height: 32),
              JoinTeamGoalWidget(),
              SizedBox(height: 32),
              JoinTeamShowTeamsButtonWidget(),
              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),
              JoinTeamAvailableTeamsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
