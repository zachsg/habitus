import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';
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
    final profile = ref.watch(profileProvider).profile;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(profileTitleString),
      // ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.face, size: 96),
                const SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      profile.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '@${profile.handle}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileStatWidget(
                  title: friendsLabelString,
                  value: profile.friends.length.toString(),
                ),
                ProfileStatWidget(
                  title: teamsLabelString,
                  value: profile.friends.length.toString(),
                ),
                ProfileStatWidget(
                  title: streakLabelString,
                  value: profile.friends.length.toString(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text(
                    bioLabelString.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    children: [
                      Text(
                        profile.bio,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
