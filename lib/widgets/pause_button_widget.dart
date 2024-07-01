import 'package:arm_fight_helper/providers/pauseWidget_controller.dart';
import 'package:arm_fight_helper/providers/phase_controller.dart';
import 'package:arm_fight_helper/providers/random_timer_controller.dart';
import 'package:arm_fight_helper/providers/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';

class PauseButtonWidget extends ConsumerWidget {
  late final ChangeNotifierProvider<TimerNotifier> local;
  PauseButtonWidget({super.key, int index = 0, ChangeNotifierProvider<TimerNotifier>? provider}){
    if(index == 0){local = timerProvider;}
    else{local = provider!;}
  }

  final IconData pauseIcon = Icons.pause_rounded;
  final IconData playIcon = Icons.play_arrow_rounded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(pauseProvider);
    ref.watch(pauseProvider).icon = pauseIcon;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
      child: RawMaterialButton(
        onPressed: () async {
          if(ref.watch(pauseProvider).icon == pauseIcon){
            ref.read(local).pauseTimer();
            ref.watch(pauseProvider).icon = playIcon;
          }
          else{
            ref.read(local).startTimer();
            ref.watch(pauseProvider).icon = pauseIcon;
          }


          /*Phases currentPhase = ref.watch(startIndicatorPhaseProvider).currentPhase;

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
*/
        },
        elevation: 2.0,
        fillColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.all(15.0),
        shape: const CircleBorder(),
        child: Icon(
          color: Theme.of(context).colorScheme.onSecondary,
          ref.watch(pauseProvider).icon,
          size: 40.0,
        ),
      ),
    );
  }



}