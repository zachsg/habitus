import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/providers.dart';
import '../../../helpers/extensions.dart';

class SettingsThemeDropdownButtonWidget extends ConsumerStatefulWidget {
  const SettingsThemeDropdownButtonWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SettingsThemeDropdownButtonWidgetState();
}

class _SettingsThemeDropdownButtonWidgetState
    extends ConsumerState<SettingsThemeDropdownButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dropdownOptions = [ThemeMode.system, ThemeMode.light, ThemeMode.dark];
    final themeProvider = ref.watch(themeServiceProvider);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<ThemeMode>(
              value: themeProvider.themeMode(),
              icon: Icon(
                Icons.arrow_downward,
                color: Theme.of(context).colorScheme.primary,
              ),
              elevation: 16,
              style: Theme.of(context).textTheme.titleMedium,
              underline: Container(
                height: 0,
                color: Theme.of(context).colorScheme.primary,
              ),
              onChanged: (ThemeMode? theme) {
                if (theme != null) {
                  themeProvider.updateThemeMode(theme);
                }
              },
              items: dropdownOptions.map<DropdownMenuItem<ThemeMode>>(
                (ThemeMode theme) {
                  return DropdownMenuItem<ThemeMode>(
                    value: theme,
                    child: Text(
                      theme.name.capitalize(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        );
      },
    );
  }
}
