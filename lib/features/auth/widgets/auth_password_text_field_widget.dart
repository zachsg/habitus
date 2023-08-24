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

  @override
  void initState() {
    _controller.text = ref.read(authProvider).password;
    super.initState();
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
          labelText: passwordString,
          hintText: createPasswordString,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
        ),
        onChanged: (password) =>
            ref.read(authProvider.notifier).setPassword(password),
        onSubmitted: (password) =>
            ref.read(authProvider.notifier).setPassword(password),
      ),
    );
  }
}
