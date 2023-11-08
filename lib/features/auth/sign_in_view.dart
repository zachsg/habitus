import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../helpers/strings.dart';
import '../habitats/habitats_view.dart';
import 'auth.dart';
import 'sign_up_view.dart';
import 'widgets/xwidgets.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  static const routeName = '/sign_in';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const AuthHeaderWidget(),
              const SizedBox(height: 24),
              const AuthTitleTextWidget(text: signInTitleString),
              AuthToggleSignInUpButtonWidget(
                text: needAccountString,
                onPressed: () {
                  context.goNamed(SignUpView.routeName);
                },
              ),
              const SizedBox(height: 24),
              const AuthEmailTextFieldWidget(),
              const AuthPasswordTextFieldWidget(),
              ref.watch(authProvider).error != null
                  ? const AuthErrorTextWidget()
                  : const SizedBox(),
              AuthSignInUpButtonWidget(
                text: signInTitleString,
                onPressed: () async {
                  final success =
                      await ref.read(authProvider.notifier).signIn();

                  if (success) {
                    if (context.mounted) {
                      context.goNamed(HabitatsView.routeName);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
