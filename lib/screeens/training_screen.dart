import 'package:arm_fight_helper/theme.dart';
import 'package:arm_fight_helper/widgets/restart_button_widget.dart';
import 'package:arm_fight_helper/widgets/rounds_indicator_widget.dart';
import 'package:arm_fight_helper/widgets/timeCount.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arm_fight_helper/widgets/start_indicator_widget.dart';

import '../l10n/app_localizations.dart';
import '../providers/phase_controller.dart';
import '../providers/random_timer_controller.dart';
import '../providers/rounds_controller.dart';
import '../providers/timer_controller.dart';
import '../widgets/pause_button_widget.dart';
import '../widgets/training_indicator_widget.dart';

// rounds_controller
final noRoundsControllerProvider = ChangeNotifierProvider<RoundsController>((ref) {
  return RoundsController(roundsNum: 2);});

// phase_controller
final localStartIndicatorPhaseProvider = ChangeNotifierProvider<StartIndicatorPhaseNotifier>((ref) {
  return StartIndicatorPhaseNotifier(ref.watch(noRoundsControllerProvider));});

// random_timer_controller
final localRandomTimerProvider = ChangeNotifierProvider<RandomTimerNotifier>((ref) {
  return RandomTimerNotifier(ref.watch(localStartIndicatorPhaseProvider));});


class TrainingScreen extends ConsumerWidget {
  // timer_controller
  late final currentProvider;


  TrainingScreen({super.key, required int time}){
    currentProvider = ChangeNotifierProvider<TimerNotifier>((ref) {
      return TimerNotifier(
          ref.watch(localStartIndicatorPhaseProvider),
          ref.watch(localRandomTimerProvider),
        key: 1,
        time: time
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context);


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).textTheme.headlineLarge?.color),
          onPressed: () {
            ref.read(currentProvider).stopTimer();
            ref.read(localStartIndicatorPhaseProvider).resetRound();
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          localization.translate("Training"),
          style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.headlineMedium
          ),
        ),
        centerTitle: true,
      ),


      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            TrainingIndicatorWidget(phase: localStartIndicatorPhaseProvider, timer: currentProvider,),
            Expanded(child: SizedBox()),
            TimeCountWidget(currentTimeProvider: currentProvider,),
            Expanded(child: SizedBox()),
            PauseButtonWidget(index: 1, provider: currentProvider,)
          ],
        ),
      ),
    );
  }

}