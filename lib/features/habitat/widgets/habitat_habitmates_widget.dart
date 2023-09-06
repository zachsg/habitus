import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../habitat.dart';

class HabitatHabitmatesWidget extends ConsumerWidget {
  const HabitatHabitmatesWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profiles = ref.watch(habitatProvider(habitat)).profiles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(),
        Text(
          habitmatesString.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Wrap(
          spacing: 16,
          children: _habitmates(profiles),
        ),
      ],
    );
  }

  List<Widget> _habitmates(List<HUProfileModel> profiles) {
    final List<Widget> children = [];

    for (final profile in profiles) {
      final text = Text(profile.name);

      children.add(text);
    }

    return children;
  }
}
