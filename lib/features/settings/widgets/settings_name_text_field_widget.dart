import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../settings.dart';

class SettingsNameTextFieldWidget extends ConsumerStatefulWidget {
  const SettingsNameTextFieldWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SettingsNameTextFieldWidgetState();
}

class _SettingsNameTextFieldWidgetState
    extends ConsumerState<SettingsNameTextFieldWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = ref.read(settingsProvider).profile.name;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: nameString,
        hintText: typeNameString,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
      onChanged: (name) => ref.read(settingsProvider.notifier).setName(name),
      onSubmitted: (name) => ref.read(settingsProvider.notifier).setName(name),
    );
  }
}
