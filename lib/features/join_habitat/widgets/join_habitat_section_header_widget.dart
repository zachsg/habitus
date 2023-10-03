import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinHabitatSectionHeaderWidget extends ConsumerWidget {
  const JoinHabitatSectionHeaderWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const SizedBox(width: 16.0),
        Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
