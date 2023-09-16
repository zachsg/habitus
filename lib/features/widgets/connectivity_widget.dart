import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/strings.dart';

class ConnectivityWidget extends ConsumerStatefulWidget {
  const ConnectivityWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConnectivityWidgetState();
}

class _ConnectivityWidgetState extends ConsumerState<ConnectivityWidget> {
  late StreamSubscription<ConnectivityResult> _subscription;
  bool _isConnected = true;

  @override
  initState() {
    super.initState();

    _subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        bool connected = true;
        switch (result) {
          case ConnectivityResult.mobile:
            connected = true;
            break;
          case ConnectivityResult.wifi:
            connected = true;
            break;
          case ConnectivityResult.none:
            connected = false;
            break;
          default:
            connected = false;
        }

        setState(() => _isConnected = connected);
      },
    );
  }

  @override
  dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isConnected
        ? const SizedBox()
        : Container(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            color: Theme.of(context).colorScheme.onBackground,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.power_off,
                  size: 24,
                  color: Theme.of(context).colorScheme.background,
                ),
                const SizedBox(width: 6.0),
                Text(
                  noNetworkString,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
          );
  }
}
