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
import '../providers/timer_controller.dart';
import '../widgets/pause_button_widget.dart';

class TrainingScreen extends ConsumerWidget {
  late final currentProvider;
  TrainingScreen({super.key, required int time}){
    currentProvider = ChangeNotifierProvider<TimerNotifier>((ref) {
      return TimerNotifier(
          ref.watch(startIndicatorPhaseProvider),
          ref.watch(randomTimerProvider),
          time: time,
          key: 1
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
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
            StartIndicatorWidget(),
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