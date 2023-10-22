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
                'Packages we use and love:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: 8.0),
            _thanksItem(
              context: context,
              name: 'Supabase',
              url: 'https://supabase.com',
            ),
            _thanksItem(
              context: context,
              name: 'Riverpod',
              url: 'https://riverpod.dev',
            ),
            _thanksItem(
              context: context,
              name: 'Firebase',
              url: 'https://firebase.google.com',
            ),
            _thanksItem(
              context: context,
              name: 'Freezed',
              url: 'https://pub.dev/packages/freezed',
            ),
            _thanksItem(
              context: context,
              name: 'Audioplayers',
              url: 'https://pub.dev/packages/audioplayers',
            ),
            _thanksItem(
              context: context,
              name: 'Timezone',
              url: 'https://pub.dev/packages/timezone',
            ),
            _thanksItem(
              context: context,
              name: 'Package_info_plus',
              url: 'https://pub.dev/packages/package_info_plus',
            ),
            _thanksItem(
              context: context,
              name: 'Wakelock_plus',
              url: 'https://pub.dev/packages/wakelock_plus',
            ),
            _thanksItem(
              context: context,
              name: 'Custom_lint',
              url: 'https://pub.dev/packages/custom_lint',
            ),
            _thanksItem(
              context: context,
              name: 'Percent_indicator',
              url: 'https://pub.dev/packages/percent_indicator',
            ),
            _thanksItem(
              context: context,
              name: 'Permission_handler',
              url: 'https://pub.dev/packages/permission_handler',
            ),
            _thanksItem(
              context: context,
              name: 'Flutter_svg',
              url: 'https://pub.dev/packages/flutter_svg',
            ),
            _thanksItem(
              context: context,
              name: 'Flutter_native_splash',
              url: 'https://pub.dev/packages/flutter_native_splash',
            ),
            _thanksItem(
              context: context,
              name: 'Flutter_launcher_icons',
              url: 'https://pub.dev/packages/flutter_launcher_icons',
            ),
            _thanksItem(
              context: context,
              name: 'Fl_chart',
              url: 'https://pub.dev/packages/fl_chart',
            ),
            _thanksItem(
              context: context,
              name: 'Flutter_local_notifications',
              url: 'https://pub.dev/packages/flutter_local_notifications',
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
