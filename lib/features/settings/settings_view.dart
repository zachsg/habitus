import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';
import 'widgets/xwidgets.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(settingsTitleString),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16.0),
              SettingsSectionHeaderWidget(text: personalDetailsString),
              SettingsSectionWidget(
                children: [
                  SettingsNameTextButtonRowWidget(),
                  SettingsSectionDividerWidget(),
                  SettingsHandleTextButtonRowWidget(),
                  SettingsSectionDividerWidget(),
                  SettingsBioTextButtonRowWidget(),
                ],
              ),
              SizedBox(height: 32.0),
              SettingsSignOutButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
