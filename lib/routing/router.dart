import 'package:go_router/go_router.dart';

import '../features/auth/sign_in_view.dart';
import '../features/auth/sign_up_view.dart';

final router = GoRouter(
  initialLocation: SignUpView.routeName,
  routes: [
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
  ],
);
