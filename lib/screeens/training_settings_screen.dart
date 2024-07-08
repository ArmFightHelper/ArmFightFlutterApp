import 'package:arm_fight_helper/screeens/competition_screen.dart';
import 'package:arm_fight_helper/screeens/training_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/history_controller.dart';
import 'history_screen.dart';
import 'package:arm_fight_helper/theme.dart';
import 'package:arm_fight_helper/l10n/app_localizations.dart';
import 'package:arm_fight_helper/language_notifier.dart';
import 'package:arm_fight_helper/providers/fight_controller.dart';


class TrainingSettingsScreen extends StatefulWidget {
  const TrainingSettingsScreen({super.key});

  @override
  _TrainingSettingsScreenState createState() => _TrainingSettingsScreenState();
}

class _TrainingSettingsScreenState extends State<TrainingSettingsScreen> {
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController secondsController = TextEditingController();

  @override
  void dispose() {
    minutesController.dispose();
    secondsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localizations.translate("Choose period"),
            ),
            SizedBox(
              child: Row(
                children: [
                  SizedBox(
                    child: TextField(
                      controller: minutesController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'minutes',
                      ),
                      inputFormatters: [
                        TimeInputFormatter(),
                      ],
                    ),
                    width: 55,
                    height: 50,
                  ),
                  Text(
                    ":",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    child: TextField(
                      controller: secondsController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'seconds',
                      ),
                      inputFormatters: [TimeInputFormatter()],
                    ),
                    width: 55,
                    height: 50,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              width: 150,
              height: 50,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TrainingScreen(
                            time: int.parse(minutesController.text) * 60 +
                                int.parse(secondsController.text),
                          )),
                );
              },
              child: Text(
                localizations.translate("go to training"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
    int val = int.parse(digitsOnly);
    if (val > 59) val = 59;
    if (val < 0) val = 0;
    final time = val.toString().padLeft(2, '0');
    return TextEditingValue(
      text: time,
      selection: TextSelection.collapsed(offset: time.length),
    );
  }
}
