import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../settings.dart';

class SettingsBottomSheetWidget extends ConsumerWidget {
  const SettingsBottomSheetWidget({
    super.key,
    required this.title,
    required this.child,
    required this.onPressed,
  });

  final String title;
  final Widget child;
  final Future<void> Function() onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 8.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    IconButton(
                      onPressed: Navigator.of(context).pop,
                      icon: const Icon(
                        Icons.cancel_outlined,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: child,
              ),
              if (ref.watch(settingsProvider).error != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    children: [
                      Text(
                        ref.watch(settingsProvider).error ?? genericErrorString,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.error),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 16),
              ref.watch(settingsProvider).loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: onPressed,
                      child: const Text('Save'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
