import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';
import '../settings.dart';

class SettingsBioTextFieldWidget extends ConsumerStatefulWidget {
  const SettingsBioTextFieldWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SettingsHandleTextFieldWidgetState();
}

class _SettingsHandleTextFieldWidgetState
    extends ConsumerState<SettingsBioTextFieldWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = ref.read(settingsProvider).profile.bio;
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
      minLines: 1,
      maxLines: 6,
      decoration: const InputDecoration(
        labelText: bioString,
        hintText: typeBioString,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
      onChanged: (bio) => ref.read(settingsProvider.notifier).setBio(bio),
      onSubmitted: (bio) => ref.read(settingsProvider.notifier).setBio(bio),
    );
  }
}
