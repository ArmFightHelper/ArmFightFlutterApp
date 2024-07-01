
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


class WinnerDialog extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fightController = ref.watch(fightControllerProvider);
    return AlertDialog(
          title: Text('Round Actions'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Choose winner.'),
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
                    child: Text(fightController.enemyName1),
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
                    child: Text(fightController.enemyName2),
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
  }
}