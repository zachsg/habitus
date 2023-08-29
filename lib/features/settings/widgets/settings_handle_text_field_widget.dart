import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../settings.dart';

class SettingsHandleTextFieldWidget extends ConsumerStatefulWidget {
  const SettingsHandleTextFieldWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SettingsHandleTextFieldWidgetState();
}

class _SettingsHandleTextFieldWidgetState
    extends ConsumerState<SettingsHandleTextFieldWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = ref.read(settingsProvider).profile.handle;
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
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        labelText: handleString,
        hintText: typeHandleString,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
      onChanged: (handle) =>
          ref.read(settingsProvider.notifier).setHandle(handle),
      onSubmitted: (handle) =>
          ref.read(settingsProvider.notifier).setHandle(handle),
    );
  }
}
