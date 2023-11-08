import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../settings.dart';
import 'xwidgets.dart';

class SettingsBioTextButtonRowWidget extends ConsumerWidget {
  const SettingsBioTextButtonRowWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return SettingsBottomSheetWidget(
              title: editBioString,
              child: const SettingsBioTextFieldWidget(),
              onPressed: () async {
                final success =
                    await ref.read(settingsProvider.notifier).saveBio();

                if (success) {
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                }
              },
            );
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            bioString,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    ref.watch(settingsProvider).profile.bio,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
