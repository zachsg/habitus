import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/sign_in_view.dart';
import '../features/auth/sign_up_view.dart';
import '../features/grow/grow_view.dart';
import '../features/join_habitat/join_habitat_view.dart';
import '../features/profile/profile_view.dart';
import '../features/settings/settings_view.dart';
import '../features/splash/splash_view.dart';
import '../features/habitats/habitats_view.dart';
import '../features/habitat/habitat_view.dart';
import '../models/xmodels.dart';

final router = GoRouter(
  initialLocation: SplashView.routeName,
  routes: [
    GoRoute(
      path: SplashView.routeName,
      name: SplashView.routeName,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: SignUpView.routeName,
      name: SignUpView.routeName,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: SignInView.routeName,
      name: SignInView.routeName,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: HabitatsView.routeName,
      name: HabitatsView.routeName,
      builder: (context, state) => const HabitatsView(),
      routes: [
        GoRoute(
          path: JoinHabitatView.routeName,
          name: JoinHabitatView.routeName,
          builder: (context, state) => const JoinHabitatView(),
          pageBuilder: (context, state) {
            return MaterialPage(
              child: HeroControllerScope(
                controller: MaterialApp.createMaterialHeroController(),
                child: LayoutBuilder(
                  builder: (ctx, constraints) => const JoinHabitatView(),
                ),
              ),
            );
          },
        ),
        GoRoute(
          path: '${HabitatView.routeName}/:id',
          name: HabitatView.routeName,
          builder: (context, state) {
            final habit = state.extra as HUHabitatModel;

            return HabitatView(habitat: habit);
          },
          routes: [
            GoRoute(
              path: '${GrowView.routeName}/:habitat_id',
              name: GrowView.routeName,
              builder: (context, state) {
                final habitAndAction = state.extra as HUHabitatAndActionModel;

                return GrowView(habitatAndAction: habitAndAction);
              },
            ),
          ],
        ),
        GoRoute(
          path: ProfileView.routeName,
          name: ProfileView.routeName,
          builder: (context, state) => const ProfileView(),
        ),
        GoRoute(
          path: SettingsView.routeName,
          name: SettingsView.routeName,
          builder: (context, state) => const SettingsView(),
        ),
      ],
    ),
  ],
);
