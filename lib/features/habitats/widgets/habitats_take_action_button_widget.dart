import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../helpers/constants.dart';
import '../../../helpers/strings.dart';
import '../../../models/xmodels.dart';
import '../../grow/grow_view.dart';

class HabitatsTakeActionButtonWidget extends ConsumerWidget {
  const HabitatsTakeActionButtonWidget({super.key, required this.habitat});

  final HUHabitatModel habitat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        context.pushNamed(
          GrowView.routeName,
          pathParameters: {
            'id': habitat.id.toString(),
            'habitat_id': habitat.id.toString(),
          },
          extra: habitat,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            habitusLogoSvg,
            semanticsLabel: habitusLogoString,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            takeActionString,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
