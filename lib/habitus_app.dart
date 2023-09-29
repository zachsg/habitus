import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'helpers/providers.dart';
import 'helpers/strings.dart';
import 'routing/router.dart';

class HabitusApp extends ConsumerStatefulWidget {
  const HabitusApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HabitusAppState();
}

class _HabitusAppState extends ConsumerState<HabitusApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
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

    return ListenableBuilder(
      listenable: theme,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          title: appNameString,
          themeMode: theme.themeMode(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
