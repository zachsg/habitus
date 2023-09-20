import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsThanksWidget extends ConsumerWidget {
  const SettingsThanksWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView(
          children: [
            const Row(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                '3rd party & open source packages we use:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: 8.0),
            _thanksItem(
              context: context,
              name: 'cupertino_icons',
              url: 'https://pub.dev/packages/cupertino_icons',
            ),
            _thanksItem(
              context: context,
              name: 'flutter_svg',
              url: 'https://pub.dev/packages/flutter_svg',
            ),
            _thanksItem(
              context: context,
              name: 'go_router',
              url: 'https://pub.dev/packages/go_router',
            ),
            _thanksItem(
              context: context,
              name: 'supabase_flutter',
              url: 'https://pub.dev/packages/supabase_flutter',
            ),
            _thanksItem(
              context: context,
              name: 'flutter_riverpod',
              url: 'https://pub.dev/packages/flutter_riverpod',
            ),
            _thanksItem(
              context: context,
              name: 'riverpod_annotation',
              url: 'https://pub.dev/packages/riverpod_annotation',
            ),
            _thanksItem(
              context: context,
              name: 'freezed',
              url: 'https://pub.dev/packages/freezed',
            ),
            _thanksItem(
              context: context,
              name: 'json_annotation',
              url: 'https://pub.dev/packages/json_annotation',
            ),
            _thanksItem(
              context: context,
              name: 'cached_network_image',
              url: 'https://pub.dev/packages/cached_network_image',
            ),
            _thanksItem(
              context: context,
              name: 'flutter_native_splash',
              url: 'https://pub.dev/packages/flutter_native_splash',
            ),
            _thanksItem(
              context: context,
              name: 'flutter_launcher_icons',
              url: 'https://pub.dev/packages/flutter_launcher_icons',
            ),
            _thanksItem(
              context: context,
              name: 'fl_chart',
              url: 'https://pub.dev/packages/fl_chart',
            ),
            _thanksItem(
              context: context,
              name: 'intl',
              url: 'https://pub.dev/packages/intl',
            ),
            _thanksItem(
              context: context,
              name: 'confetti',
              url: 'https://pub.dev/packages/confetti',
            ),
            _thanksItem(
              context: context,
              name: 'audioplayers',
              url: 'https://pub.dev/packages/audioplayers',
            ),
            _thanksItem(
              context: context,
              name: 'flutter_local_notifications',
              url: 'https://pub.dev/packages/flutter_local_notifications',
            ),
            _thanksItem(
              context: context,
              name: 'timezone',
              url: 'https://pub.dev/packages/timezone',
            ),
            _thanksItem(
              context: context,
              name: 'lottie',
              url: 'https://pub.dev/packages/lottie',
            ),
            _thanksItem(
              context: context,
              name: 'shared_preferences',
              url: 'https://pub.dev/packages/shared_preferences',
            ),
            _thanksItem(
              context: context,
              name: 'package_info_plus',
              url: 'https://pub.dev/packages/package_info_plus',
            ),
            _thanksItem(
              context: context,
              name: 'wakelock_plus',
              url: 'https://pub.dev/packages/wakelock_plus',
            ),
            _thanksItem(
              context: context,
              name: 'url_launcher',
              url: 'https://pub.dev/packages/url_launcher',
            ),
            _thanksItem(
              context: context,
              name: 'flutter_lints',
              url: 'https://pub.dev/packages/flutter_lints',
            ),
            _thanksItem(
              context: context,
              name: 'build_runner',
              url: 'https://pub.dev/packages/build_runner',
            ),
            _thanksItem(
              context: context,
              name: 'riverpod_generator',
              url: 'https://pub.dev/packages/riverpod_generator',
            ),
            _thanksItem(
              context: context,
              name: 'custom_lint',
              url: 'https://pub.dev/packages/custom_lint',
            ),
            _thanksItem(
              context: context,
              name: 'riverpod_lint',
              url: 'https://pub.dev/packages/riverpod_lint',
            ),
            _thanksItem(
              context: context,
              name: 'json_serializable',
              url: 'https://pub.dev/packages/json_serializable',
            ),
            _thanksItem(
              context: context,
              name: 'firebase_core',
              url: 'https://pub.dev/packages/firebase_core',
            ),
            _thanksItem(
              context: context,
              name: 'firebase_messaging',
              url: 'https://pub.dev/packages/firebase_messaging',
            ),
          ],
        ),
      ),
    );
  }

  Widget _thanksItem({
    required BuildContext context,
    required String name,
    required String url,
  }) {
    final uri = Uri.parse(url);

    final isIOS = Platform.isIOS;

    return TextButton(
      onPressed: () => launchUrl(uri),
      child: Row(
        children: [
          Icon(
            isIOS ? CupertinoIcons.arrowtriangle_right_fill : Icons.arrow_right,
            size: isIOS ? 12.0 : 22.0,
          ),
          const SizedBox(width: 4.0),
          Text(name),
        ],
      ),
    );
  }
}
