import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wakelock/wakelock.dart';

import '../../helpers/constants.dart';
import '../../helpers/strings.dart';
import '../../models/xmodels.dart';
import '../grow/grow_view.dart';
import 'habitat.dart';
import 'widgets/xwidget.dart';

class HabitatView extends ConsumerStatefulWidget {
  const HabitatView({super.key, required this.habitat});

  final HUHabitatModel habitat;

  static const routeName = 'habitat';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HabitatViewState();
}

class _HabitatViewState extends ConsumerState<HabitatView> {
  @override
  void initState() {
    _initialDataLoad();
    super.initState();
  }

  Future<void> _initialDataLoad() async {
    await ref.read(habitatProvider(widget.habitat).notifier).loadProfiles();
    await ref.read(habitatProvider(widget.habitat).notifier).loadActions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.habitat.name),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              Text(
                habitatGoalString.toUpperCase(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              HabitatGoalProgressChartWidget(habitat: widget.habitat),
              const SizedBox(height: 8.0),
              HabitatHabitmatesWidget(habitat: widget.habitat),
              const SizedBox(height: 32.0),
              HabitatActivityWidget(habitat: widget.habitat),
              const SizedBox(height: 96),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Wakelock.enable();

          context.pushNamed(
            GrowView.routeName,
            pathParameters: {
              'id': widget.habitat.id.toString(),
              'habitat_id': widget.habitat.id.toString(),
            },
            extra: widget.habitat,
          );
        },
        label: Row(
          children: [
            const Text(takeActionString),
            const SizedBox(width: 8),
            SvgPicture.asset(
              habitusLogoSvg,
              semanticsLabel: habitusLogoString,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.onPrimaryContainer,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
