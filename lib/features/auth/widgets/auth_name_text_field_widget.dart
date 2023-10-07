import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../auth.dart';

class AuthNameTextFieldWidget extends ConsumerStatefulWidget {
  const AuthNameTextFieldWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthNameTextFieldWidgetState();
}

class _AuthNameTextFieldWidgetState
    extends ConsumerState<AuthNameTextFieldWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = ref.read(authProvider).name;
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
        textCapitalization: TextCapitalization.words,
        autocorrect: false,
        decoration: const InputDecoration(
          labelText: nameString,
          hintText: typeNameString,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
        ),
        onChanged: (name) => ref.read(authProvider.notifier).setName(name),
        onFieldSubmitted: (name) =>
            ref.read(authProvider.notifier).setName(name),
      ),
    );
  }
}
