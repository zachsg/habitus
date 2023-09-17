import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsAppVersionWidget extends ConsumerStatefulWidget {
  const SettingsAppVersionWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SettingsAppVersionWidgetState();
}

class _SettingsAppVersionWidgetState
    extends ConsumerState<SettingsAppVersionWidget> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    _loadPackageInfo();
    super.initState();
  }

  Future<void> _loadPackageInfo() async {
    final info = await PackageInfo.fromPlatform();

    setState(() => _packageInfo = info);
  }

  @override
  Widget build(BuildContext context) {
    final number = _packageInfo.buildNumber;
    final version = _packageInfo.version;

    return Text(
      'App: $version ($number)'.toUpperCase(),
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
