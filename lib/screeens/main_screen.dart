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

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeColors = Theme.of(context).extension<ThemeColors>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 250),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColors.mainMenuButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SettingsScreen(),
                  );
                },
                child: Text(
                  localizations.translate("competition"),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColors.mainMenuButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => TrainingSettingsScreen(),
                  );
                },
                child: Text(
                  localizations.translate("training"),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  ),
                  onPressed: () {
                    ref.read(themeProvider.notifier).toggleTheme();
                  },
                  child: Icon(
                    Icons.wb_sunny_outlined,
                    color: colorScheme.primary,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HistoryScreen()),
                    );
                  },
                  child: Text(
                    localizations.translate("history"),
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  ),
                  onPressed: () {
                    ref.read(languageProvider.notifier).toggleLanguage();
                  },
                  child: Icon(
                    Icons.language,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final fightController = ref.watch(fightControllerProvider);
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localizations.translate("settings"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(const Size(127, 80)),
                    child: TextFormField(
                      onChanged: (String? value) {
                        fightController.enemyName1 = value ?? "";
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        labelText: "Name",
                        labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tight(const Size(127, 80)),
                  child: TextFormField(
                    onChanged: (String? value) {
                      fightController.enemyName2 = value ?? "";
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      labelText: localizations.translate("Name"),
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(127, 80)),
              child: TextFormField(
                onChanged: (String? value) {
                  ref.read(fightControllerProvider).roundsNum = int.tryParse(value ?? "") ?? 0;
                },
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  labelText: localizations.translate("Rounds"),
                  labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // fightController.saveFightData();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompetitionScreen()),
                );
              },
              child: Text(
                localizations.translate("go to competition"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrainingSettingsScreen extends StatefulWidget {
  const TrainingSettingsScreen({super.key});

  @override
  _TrainingSettingsScreenState createState() => _TrainingSettingsScreenState();
}

class _TrainingSettingsScreenState extends State<TrainingSettingsScreen>{
  final TextEditingController minutesController = TextEditingController() ..text= '01';
  final TextEditingController secondsController = TextEditingController() ..text= '00';

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
            Text(localizations.translate("Choose period"),),
            SizedBox(child:  Row(children: [
              SizedBox(child:  TextField(

                controller: minutesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'minutes',
                ),
                inputFormatters: [
                  TimeInputFormatter(),
                ],
              ), width: 55,
                height: 50,
              ),
              Text(":", style: TextStyle(fontSize: 30),),
              SizedBox(child:  TextField(
                controller: secondsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'seconds',
                ),
                inputFormatters: [
                  TimeInputFormatter()
                ],
              ), width: 55,
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

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(buildLightTheme());

  void toggleTheme() {
    state = state.brightness == Brightness.light ? buildDarkTheme() : buildLightTheme();
  }
}

class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier() : super(Locale('en'));

  void toggleLanguage() {
    state = state.languageCode == 'en' ? Locale('ru') : Locale('en');
  }
}
