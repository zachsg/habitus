import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'profile.dart';
import 'widgets/xwidgets.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  static const routeName = '/profile';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  void initState() {
    ref.read(profileProvider.notifier).loadProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text(profileTitleString),
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 32),
              ProfileHeaderWidget(),
              SizedBox(height: 32),
              ProfileStatsRowWidget(),
              SizedBox(height: 32),
              ProfileBioWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
