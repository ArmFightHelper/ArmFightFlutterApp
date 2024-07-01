
import 'package:arm_fight_helper/providers/rounds_controller.dart';
import 'package:arm_fight_helper/widgets/restart_button_widget.dart';
import 'package:arm_fight_helper/widgets/rounds_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arm_fight_helper/widgets/start_indicator_widget.dart';
import '../providers/fight_controller.dart';
import 'package:arm_fight_helper/providers/phase_controller.dart';
import 'package:arm_fight_helper/widgets/dialogue_window.dart';
import 'package:arm_fight_helper/constants.dart';

class CompetitionScreen extends ConsumerWidget {
  const CompetitionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startIndicatorPhaseNotifier = ref.watch(startIndicatorPhaseProvider);

    // Check if the current phase is "GO" and show dialog
    if (startIndicatorPhaseNotifier.currentPhase == Phases.start && ref.watch(roundsControllerProvider).currentRoundIndex != 0) {
      _showWinnerDialog(context);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Competition",
          style: GoogleFonts.inter(
            textStyle: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            StartIndicatorWidget(),
            RoundsWidget(),
            Expanded(child: SizedBox()),
            PauseButtonWidget(),
          ],
        ),
      ),
    );
  }

  Future<void> _showWinnerDialog(BuildContext context) async {
    Future.delayed(Duration.zero, () => showDialog(context: context, builder: (BuildContext context) {
        return WinnerDialog();
      },)
      ); 
      // showDialog<void>(

      // context: context,
      // barrierDismissible: false, // user must tap button to close dialog
      // builder: (BuildContext context) {
      //   return WinnerDialog();
      // },
    // );
  }
}