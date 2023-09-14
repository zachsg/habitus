import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitus/features/settings/widgets/xwidgets.dart';

import '../../../helpers/strings.dart';

class SettingsThemeToggleRowWidget extends ConsumerWidget {
  const SettingsThemeToggleRowWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            themeString,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SettingsThemeDropdownButtonWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
