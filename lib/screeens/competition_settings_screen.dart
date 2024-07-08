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

class SettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final fightController = ref.watch(fightControllerProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
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
        ),
      ),
    );
  }
}