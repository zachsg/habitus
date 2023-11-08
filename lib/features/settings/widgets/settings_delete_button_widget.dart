import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobn/helpers/extensions.dart';

import '../../../helpers/strings.dart';
import '../../auth/sign_in_view.dart';
import '../settings.dart';

class SettingsDeleteButtonWidget extends ConsumerWidget {
  const SettingsDeleteButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => _showSessionCompleteDialog(context, ref),
          child: Text(
            deleteString,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Theme.of(context).colorScheme.error),
          ),
        ),
      ],
    );
  }

  Future<void> _showSessionCompleteDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final settings = ref.watch(settingsProvider);

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(deleteConfirmationTitleString),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text(deleteConfirmationSubtitleString),
              ],
            ),
          ),
          actions: [
            settings.loading
                ? const CircularProgressIndicator.adaptive()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: Navigator.of(context).pop,
                        child: Text(
                          'Cancel',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      TextButton(
                        child: Text(
                          'Yes',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.error),
                        ),
                        onPressed: () async {
                          final success = await ref
                              .read(settingsProvider.notifier)
                              .deleteAccount();

                          if (success) {
                            if (context.mounted) {
                              context.showSnackBar(
                                message: deletionRequestInProgressString,
                                seconds: 15,
                              );

                              ref.read(settingsProvider.notifier).signOut();
                              context.goNamed(SignInView.routeName);
                            }
                          }

                          if (context.mounted) {
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  ),
          ],
        );
      },
    );
  }
}
