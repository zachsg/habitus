import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobn/helpers/extensions.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../helpers/providers.dart';
import '../../helpers/strings.dart';
import '../../models/xmodels.dart';
import '../../services/local_notification_service.dart';
import '../../services/remote_notification_service.dart';
import '../habitat/habitat.dart';
import '../profile/profile.dart';
import 'grow.dart';
import 'widgets/xwidgets.dart';

class GrowView extends ConsumerStatefulWidget {
  const GrowView({super.key, required this.habitatAndAction});

  final HUHabitatAndActionModel habitatAndAction;

  static const routeName = 'grow';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GrowViewState();
}

class _GrowViewState extends ConsumerState<GrowView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final grow = ref.watch(growProvider(widget.habitatAndAction));
    final profile = ref.watch(profileProvider).profile;

    final themeP = ref.watch(themeProvider);

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final isIOS = Platform.isIOS;

    final icon = isIOS ? CupertinoIcons.eye_slash : Icons.visibility_off;
    final iconMinimal = isIOS ? CupertinoIcons.eye_fill : Icons.visibility;

    final habitType = widget.habitatAndAction.habitat.goal.habit;

    return WillPopScope(
      onWillPop: () => saveOrDelete(ref, context, grow.goalMet),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: themeP.minimalTimer()
                ? isDark
                    ? null
                    : Theme.of(context).colorScheme.onPrimaryContainer
                : null,
            appBar: AppBar(
              foregroundColor: themeP.minimalTimer()
                  ? Colors.white.withOpacity(0.8)
                  : Theme.of(context).colorScheme.onBackground,
              backgroundColor: themeP.minimalTimer()
                  ? isDark
                      ? null
                      : Theme.of(context).colorScheme.onPrimaryContainer
                  : null,
              title: Text(
                habitType.habitDoing(),
              ),
              actions: [
                IconButton(
                  padding: const EdgeInsets.all(12.0),
                  onPressed: themeP.toggleMinimalTimer,
                  icon: Icon(
                    themeP.minimalTimer() ? iconMinimal : icon,
                    color: themeP.minimalTimer()
                        ? isDark
                            ? Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).colorScheme.background
                        : null,
                    size: 32,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                grow.goalMet
                    ? GrowStopwatchWidget(
                        profile: profile,
                        habitatAndAction: widget.habitatAndAction,
                      )
                    : GrowTimerWidget(
                        profile: profile,
                        habitatAndAction: widget.habitatAndAction,
                        finished: () {
                          _playTone();
                        },
                      ),
                const SizedBox(height: 16.0),
                FilledButton(
                  onPressed: () {
                    WakelockPlus.disable();
                    ref
                        .read(growProvider(widget.habitatAndAction).notifier)
                        .setPaused(true);

                    _showSessionCompleteDialog(
                      ref,
                      context,
                      widget.habitatAndAction,
                      grow.goalMet,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 20.0,
                    ),
                    child: Text(grow.goalMet
                        ? pauseString
                        : 'Done ${habitType.habitDoing()}'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<bool> saveOrDelete(
    WidgetRef ref,
    BuildContext context,
    bool goalMet,
  ) async {
    WakelockPlus.disable();

    ref.read(growProvider(widget.habitatAndAction).notifier).setPaused(true);

    _showSessionCompleteDialog(
      ref,
      context,
      widget.habitatAndAction,
      goalMet,
    );

    return true;
  }

  Future<void> _playTone() async =>
      AudioPlayer().play(AssetSource('sounds/singing-bowl.mp3'), volume: 0.5);

  Future<void> _showSessionCompleteDialog(
    WidgetRef ref,
    BuildContext context,
    HUHabitatAndActionModel habitatAndAction,
    bool goalMet,
  ) async {
    final grow = ref.watch(growProvider(habitatAndAction));
    bool loading = false;

    final habitType = widget.habitatAndAction.habitat.goal.habit;

    int elapsed = (grow.elapsed / 60).round();

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        if (!goalMet) {
          elapsed -= habitatAndAction.elapsed;
        }

        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text(
              'You ${habitType.habitDid().toLowerCase()} '
              'for ${elapsed.round().toTimeLong()}',
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  elapsed.round() == 0
                      ? const SizedBox()
                      : GrowCalloutWidget(
                          habitatAndAction: widget.habitatAndAction,
                          setState: setState,
                        ),
                ],
              ),
            ),
            actions: [
              loading
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator.adaptive(),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: elapsed.round() == 0
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          child: Text(
                            elapsed.round() == 0 ? 'Cancel' : 'Delete',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: Theme.of(context).colorScheme.error),
                          ),
                          onPressed: () {
                            WakelockPlus.disable();

                            LocalNotificationService()
                                .cancelNotificationWithId(0);

                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                        ),
                        elapsed.round() == 0
                            ? const SizedBox()
                            : TextButton(
                                child: Text(
                                  'Save',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                onPressed: () async {
                                  setState(() => loading = true);

                                  WakelockPlus.disable();

                                  LocalNotificationService()
                                      .cancelNotificationWithId(0);

                                  await ref
                                      .read(growProvider(habitatAndAction)
                                          .notifier)
                                      .save(elapsed.round());

                                  _notifyNewAction();

                                  setState(() => loading = false);

                                  if (context.mounted) {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  }
                                },
                              ),
                      ],
                    ),
            ],
          );
        });
      },
    );
  }

  Future<void> _notifyNewAction() async {
    final profiles = ref
        .read(habitatProvider(widget.habitatAndAction.habitat))
        .profiles
        .toList();
    final profile = ref.read(profileProvider).profile;
    final calloutId = ref.read(growProvider(widget.habitatAndAction)).calloutId;
    HUProfileModel? calloutProfile;
    if (calloutId.isNotEmpty) {
      calloutProfile =
          profiles.firstWhere((profile) => profile.id == calloutId);
    }

    profiles.removeWhere((p) => p.id == profile.id || p.pushToken.isEmpty);

    final habitType = widget.habitatAndAction.habitat.goal.habit;

    final habitat = widget.habitatAndAction.habitat;
    final title = habitat.name;
    final subtitle = calloutProfile != null
        ? '@${profile.handle} just finished ${habitType.habitDoing().toLowerCase()} and called out @${calloutProfile.handle}'
        : '@${profile.handle} just finished ${habitType.habitDoing().toLowerCase()}';

    List<String> tokens = [];
    for (final profile in profiles) {
      tokens.add(profile.pushToken);
    }

    await RemoteNotificationService.newActionNotification(
      tokens: tokens,
      title: title,
      subtitle: subtitle,
      habitat: habitat,
    );
  }
}
