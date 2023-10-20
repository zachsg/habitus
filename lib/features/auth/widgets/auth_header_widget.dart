import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../helpers/constants.dart';
import '../../../helpers/strings.dart';

class AuthHeaderWidget extends ConsumerWidget {
  const AuthHeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            mobnLogoSvg,
            semanticsLabel: mobnLogoString,
            width: 28,
            height: 28,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onBackground,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            appNameString,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
