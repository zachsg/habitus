import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/constants.dart';
import '../../helpers/strings.dart';
import '../../models/xmodels.dart';
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
    ref.read(habitatProvider(widget.habitat).notifier).loadProfiles();
    ref.read(habitatProvider(widget.habitat).notifier).loadActions();
    super.initState();
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
              const PieChartSample3(),
              const SizedBox(height: 8.0),
              HabitatHabitmatesWidget(habitat: widget.habitat),
              const SizedBox(height: 32.0),
              HabitatActivityWidget(habitat: widget.habitat),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Start timer and show timer view
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
