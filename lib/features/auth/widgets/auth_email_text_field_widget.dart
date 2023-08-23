import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../auth.dart';

class AuthEmailTextFieldWidget extends ConsumerStatefulWidget {
  const AuthEmailTextFieldWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthEmailTextFieldWidgetState();
}

class _AuthEmailTextFieldWidgetState
    extends ConsumerState<AuthEmailTextFieldWidget> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(hintText: typeEmailString),
        onChanged: (email) => ref.read(authProvider.notifier).setEmail(email),
        onSubmitted: (email) => ref.read(authProvider.notifier).setEmail(email),
      ),
    );
  }
}
