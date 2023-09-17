import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';
import 'settings.dart';
import 'widgets/xwidgets.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  static const routeName = 'settings';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  @override
  void initState() {
    ref.read(settingsProvider.notifier).loadProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  // TODO: Add avatar picker
                ],
              ),
              SizedBox(height: 24.0),
              SettingsSectionHeaderWidget(text: themeDetailsString),
              SettingsSectionWidget(
                children: [
                  SettingsThemeToggleRowWidget(),
                  SettingsSectionDividerWidget(),
                  SettingsMinimalToggleRowWidget(),
                ],
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SettingsSignOutButtonWidget(),
                  SettingsDeleteButtonWidget(),
                ],
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SettingsAppVersionWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
