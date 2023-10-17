import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobn/helpers/extensions.dart';

import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../habitat_settings.dart';

class HabitatSettingsSearchHabitmateWidget extends ConsumerStatefulWidget {
  const HabitatSettingsSearchHabitmateWidget({
    super.key,
    required this.habitat,
  });

  final HUHabitatModel habitat;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HabitatSettingsSearchHabitmateWidgetState();
}

class _HabitatSettingsSearchHabitmateWidgetState
    extends ConsumerState<HabitatSettingsSearchHabitmateWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.none,
            autocorrect: false,
            decoration: const InputDecoration(
              labelText: habitatSettingsHabitmateSearchString,
              hintText: habitatSettingsHabitmateSearchHintString,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
            ),
            onChanged: (text) => ref
                .read(habitatSettingsProvider(widget.habitat).notifier)
                .setSearch(text),
            onFieldSubmitted: (text) {
              if (text.isEmpty) {
                const message = 'Enter someone\'s name or handle';
                context.showSnackBar(message: message);
              } else {
                ref
                    .read(habitatSettingsProvider(widget.habitat).notifier)
                    .searchForHabitmates(text);
              }
            },
          ),
        ),
        IconButton(
          onPressed: () async {
            final text =
                ref.read(habitatSettingsProvider(widget.habitat)).search;

            if (text.isEmpty) {
              const message = 'Enter someone\'s name or handle';
              context.showSnackBar(message: message);
            } else {
              await ref
                  .read(habitatSettingsProvider(widget.habitat).notifier)
                  .searchForHabitmates(text);

              if (context.mounted) {
                FocusScope.of(context).unfocus();
              }
            }
          },
          color: Theme.of(context).colorScheme.primary,
          icon: Icon(isIOS ? CupertinoIcons.search : Icons.search),
        ),
      ],
    );
  }
}
