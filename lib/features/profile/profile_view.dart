import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';
import 'profile.dart';

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
    final profile = ref.watch(profileProvider).profile;

    return Scaffold(
      appBar: AppBar(
        title: const Text(profileTitleString),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Text(profile.name),
        ],
      )),
    );
  }
}
