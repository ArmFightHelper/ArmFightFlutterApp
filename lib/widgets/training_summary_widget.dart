import 'package:arm_fight_helper/providers/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../l10n/app_localizations.dart';
import '../providers/phase_controller.dart';

class TrainingSummaryWidget extends ConsumerWidget {
  final int _totalTime;
  final ChangeNotifierProvider<StartIndicatorPhaseNotifier> phaseProvider;
  final ChangeNotifierProvider<TimerNotifier> timerProvider;

  TrainingSummaryWidget(this._totalTime, this.phaseProvider, this.timerProvider);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context);


    return AlertDialog(
      title: Text(localization.translate("training_summary")),
      titleTextStyle: Theme.of(context).textTheme.headlineMedium,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              ref.read(phaseProvider).resetRound();
              ref.read(timerProvider).stopTimer();
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: Text(
              "OK",
              style: Theme.of(context).textTheme.bodyMedium,
            ))
      ],
      content: Text(
          "${localization.translate("total_time")}: "
              "${DateFormat("mm:ss").format(
              DateTime(
                  0, 0, 0, 0,
                  ref.watch(timerProvider).totalTime ~/ 60,
                  ref.watch(timerProvider).totalTime % 60
              )
          )}"
      ),
    );
  }
}