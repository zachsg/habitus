import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';
import 'profile.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(profileTitleString),
      ),
      body: SafeArea(
        child: Center(
          child: ref.watch(profileProvider).loading
              ? const CircularProgressIndicator()
              : TextButton(
                  onPressed: ref.read(profileProvider.notifier).updateProfile,
                  child: const Text('Update Profile'),
                ),
        ),
      ),
    );
  }
}
