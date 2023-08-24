import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../helpers/strings.dart';
import 'auth.dart';
import 'sign_in_view.dart';
import 'widgets/xwidgets.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});

  static const routeName = '/sign_up';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(authProvider).password ==
            ref.watch(authProvider).confirmPassword &&
        ref.watch(authProvider).password.isNotEmpty;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const AuthHeaderWidget(),
              const SizedBox(height: 24),
              const AuthTitleTextWidget(text: signUpTitleString),
              AuthToggleSignInUpButtonWidget(
                text: alreadyHaveAccountString,
                onPressed: () => context.goNamed(SignInView.routeName),
              ),
              const SizedBox(height: 24),
              const AuthEmailTextFieldWidget(),
              const AuthPasswordTextFieldWidget(),
              const AuthConfirmPasswordTextFieldWidget(),
              const AuthErrorTextWidget(),
              isValid
                  ? AuthSignInUpButtonWidget(
                      text: signUpTitleString,
                      onPressed: () async {
                        await ref.read(authProvider.notifier).signUp(context);
                      },
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
