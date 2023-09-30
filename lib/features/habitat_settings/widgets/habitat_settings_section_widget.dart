import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HabitatSettingsSectionWidget extends ConsumerWidget {
  const HabitatSettingsSectionWidget({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.05),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
