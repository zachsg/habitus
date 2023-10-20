import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../models/xmodels.dart';
import '../habitat.dart';

class HabitatDaySelectorWidget extends ConsumerWidget {
  const HabitatDaySelectorWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIOS = Platform.isIOS;
    final DateFormat formatter = DateFormat('MMM d');
    final formattedDate =
        formatter.format(ref.watch(habitatProvider(habitat)).day.toLocal());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: ref.read(habitatProvider(habitat).notifier).previousDay,
          icon: Icon(
            isIOS ? CupertinoIcons.back : Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 12.0),
        Text(
          formattedDate,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(width: 12.0),
        IconButton(
          onPressed: ref.read(habitatProvider(habitat).notifier).resetDay,
          icon: Icon(
            isIOS ? CupertinoIcons.sun_max_fill : Icons.sunny,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
