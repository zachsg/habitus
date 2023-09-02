import 'package:go_router/go_router.dart';

import '../features/auth/sign_in_view.dart';
import '../features/auth/sign_up_view.dart';
import '../features/bottom_nav/bottom_nav_view.dart';
import '../features/join_team/join_team_view.dart';
import '../features/profile/profile_view.dart';
import '../features/settings/settings_view.dart';
import '../features/splash/splash_view.dart';
import '../features/home/home_view.dart';

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
      path: BottomNavView.routeName,
      name: BottomNavView.routeName,
      builder: (context, state) => const BottomNavView(),
    ),
    GoRoute(
      path: HomeView.routeName,
      name: HomeView.routeName,
      builder: (context, state) => const HomeView(),
      routes: [
        GoRoute(
          path: JoinTeamView.routeName,
          name: JoinTeamView.routeName,
          builder: (context, state) => const JoinTeamView(),
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
);
