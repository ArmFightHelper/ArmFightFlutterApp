import 'package:arm_fight_helper/providers/phase_controller.dart';
import 'package:arm_fight_helper/providers/random_timer_controller.dart';
import 'package:arm_fight_helper/providers/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';

class PauseButtonWidget extends ConsumerWidget {
  const PauseButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
      child: RawMaterialButton(
        onPressed: () async {
          Phases currentPhase = ref.watch(startIndicatorPhaseProvider).currentPhase;

          switch (currentPhase) {
            case Phases.preparation:
              ref.read(timerProvider).stopTimer();
              ref.read(startIndicatorPhaseProvider).resetRound();
              break;
            case Phases.ready:
              break;
            case Phases.go:
              ref.read(startIndicatorPhaseProvider).endCurrentRound();
              break;
            default:
              break;

          }
        },
        elevation: 2.0,
        fillColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.all(15.0),
        shape: const CircleBorder(),
        child: Icon(
          color: Theme.of(context).colorScheme.onSecondary,
          Icons.refresh_rounded,
          size: 40.0,
        ),
      ),
    );
  }



}