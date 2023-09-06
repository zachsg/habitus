import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/strings.dart';

class HabitatsEmptyStateWidget extends ConsumerStatefulWidget {
  const HabitatsEmptyStateWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeEmptyStateWidgetState();
}

class _HomeEmptyStateWidgetState
    extends ConsumerState<HabitatsEmptyStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        homeEmptyString,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
