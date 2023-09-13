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
  bool _isVisible = false;

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
      child: TextFormField(
        controller: _controller,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isVisible ? false : true,
        autocorrect: false,
        enableSuggestions: false,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(_isVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () => setState(() => _isVisible = !_isVisible),
          ),
          labelText: passwordAgainString,
          hintText: confirmPasswordString,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
        ),
        onChanged: (password) =>
            ref.read(authProvider.notifier).setConfirmPassword(password),
        onFieldSubmitted: (password) =>
            ref.read(authProvider.notifier).setConfirmPassword(password),
      ),
    );
  }
}
