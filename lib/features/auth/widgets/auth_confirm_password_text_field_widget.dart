import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../auth.dart';

class AuthConfirmPasswordTextFieldWidget extends ConsumerStatefulWidget {
  const AuthConfirmPasswordTextFieldWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthConfirmPasswordTextFieldWidgetState();
}

class _AuthConfirmPasswordTextFieldWidgetState
    extends ConsumerState<AuthConfirmPasswordTextFieldWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = ref.read(authProvider).confirmPassword;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: const InputDecoration(
          labelText: passwordAgainString,
          hintText: confirmPasswordString,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
        ),
        onChanged: (password) =>
            ref.read(authProvider.notifier).setConfirmPassword(password),
        onSubmitted: (password) =>
            ref.read(authProvider.notifier).setConfirmPassword(password),
      ),
    );
  }
}
