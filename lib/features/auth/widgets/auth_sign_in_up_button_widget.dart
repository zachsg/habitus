import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth.dart';

class AuthSignInUpButtonWidget extends ConsumerWidget {
  const AuthSignInUpButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(authProvider).loading;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: FilledButton.tonal(
        onPressed: loading ? null : onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(loading ? 16.0 : 24.0),
              child: loading ? const CircularProgressIndicator() : Text(text),
            ),
          ],
        ),
      ),
    );
  }
}
