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
  void initState() {
    _controller.text = ref.read(authProvider).email;
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
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: emailString,
          hintText: typeEmailString,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
        ),
        onChanged: (email) => ref.read(authProvider.notifier).setEmail(email),
        onSubmitted: (email) => ref.read(authProvider.notifier).setEmail(email),
      ),
    );
  }
}
