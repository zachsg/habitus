import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(profileTitleString),
      ),
      body: const SafeArea(
        child: Center(
          child: Text(profileTitleString),
        ),
      ),
    );
  }
}
