import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/xwidgets.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});

  static const routeName = '/sign_up';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeaderWidget(),
            AuthEmailTextFieldWidget(),
          ],
        ),
      ),
    );
  }
}
