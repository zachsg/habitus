import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/providers.dart';
import '../../../helpers/strings.dart';

class SettingsMinimalToggleRowWidget extends ConsumerStatefulWidget {
  const SettingsMinimalToggleRowWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SettingsMinimalToggleRowWidgetState();
}

class _SettingsMinimalToggleRowWidgetState
    extends ConsumerState<SettingsMinimalToggleRowWidget>
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
    final theme = ref.watch(themeProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            minimalString,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Switch.adaptive(
                      value: theme.minimalTimer(),
                      onChanged: (isOn) => theme.toggleMinimalTimer(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
