import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../auth.dart';

class AuthPasswordTextFieldWidget extends ConsumerStatefulWidget {
  const AuthPasswordTextFieldWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthPasswordTextFieldWidgetState();
}

class _AuthPasswordTextFieldWidgetState
    extends ConsumerState<AuthPasswordTextFieldWidget> {
  final _controller = TextEditingController();
  bool _isVisible = false;

  @override
  void initState() {
    _controller.text = ref.read(authProvider).password;
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
          labelText: passwordString,
          hintText: createPasswordString,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
        ),
        onChanged: (password) =>
            ref.read(authProvider.notifier).setPassword(password),
        onFieldSubmitted: (password) =>
            ref.read(authProvider.notifier).setPassword(password),
      ),
    );
  }
}
