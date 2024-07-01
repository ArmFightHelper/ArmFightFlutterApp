import 'package:arm_fight_helper/widgets/restart_button_widget.dart';
import 'package:arm_fight_helper/widgets/rounds_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arm_fight_helper/widgets/start_indicator_widget.dart';
import 'package:arm_fight_helper/providers/phase_controller.dart';
import 'package:arm_fight_helper/providers/fight_controller.dart';
import 'package:arm_fight_helper/theme.dart';
import 'package:arm_fight_helper/language_notifier.dart';
import 'package:arm_fight_helper/l10n/app_localizations.dart';

class CompetitionScreen extends ConsumerWidget {
  final String enemyName1;
  final String enemyName2;

  const CompetitionScreen({
    super.key,
    required this.enemyName1,
    required this.enemyName2,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {                
    final startIndicatorPhaseNotifier = ref.watch(startIndicatorPhaseProvider.notifier);

    startIndicatorPhaseNotifier.onGoPhaseReached = () {
      _showMyDialog(context);
    };

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

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button to close dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Round Actions'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Choose the winner of this round.'),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(100),
                    ),
                    child: Text(enemyName1),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Handle Action 1
                    },
                  ),
                  SizedBox(height: 20), // Space between buttons
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(100),
                    ),
                    child: Text(enemyName2),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Handle Action 2
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}