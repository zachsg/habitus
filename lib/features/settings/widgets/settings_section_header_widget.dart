import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsSectionHeaderWidget extends ConsumerWidget {
  const SettingsSectionHeaderWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 24.0,
      ),
      child: Row(
        children: [
          Text(text.toUpperCase()),
        ],
      ),
    );
  }
}
