import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../auth.dart';

class AuthHandleTextFieldWidget extends ConsumerStatefulWidget {
  const AuthHandleTextFieldWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthHandleTextFieldWidgetState();
}

class _AuthHandleTextFieldWidgetState
    extends ConsumerState<AuthHandleTextFieldWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = ref.read(authProvider).handle;
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
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
        decoration: const InputDecoration(
          labelText: handleString,
          hintText: typeHandleString,
          prefix: Text('@'),
          // prefixIcon: Icon(Icons.alternate_email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
        ),
        onChanged: (handle) =>
            ref.read(authProvider.notifier).setHandle(handle),
        onFieldSubmitted: (handle) =>
            ref.read(authProvider.notifier).setHandle(handle),
      ),
    );
  }
}
