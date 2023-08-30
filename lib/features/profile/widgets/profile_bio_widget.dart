import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../profile.dart';

class ProfileBioWidget extends ConsumerWidget {
  const ProfileBioWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Text(
            bioLabelString.toUpperCase(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Wrap(
            children: [
              Text(
                ref.watch(profileProvider).profile.bio,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
