import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:arm_fight_helper/providers/history_controller.dart';

import '../models/fight_session_model.dart';

final fightControllerProvider = ChangeNotifierProvider<FightController>((ref) {
  return FightController(historyController: ref.watch(historyControllerProvider));
});

class FightController extends ChangeNotifier {
  String? _enemyName1;
  String? _enemyName2;
  int? _roundsNum;
  HistoryController historyController;

  FightController({required this.historyController});

  void reset() {
    _enemyName1 = null;
    _enemyName2 = null;
    _roundsNum = null;
    notifyListeners();
  }

  set enemyName1(String value) {
    _enemyName1 = value;
    notifyListeners();
  }

  set enemyName2(String value) {
    _enemyName2 = value;
    notifyListeners();
  }

  set roundsNum(int value) {
    _roundsNum = value;
    print('roundsNum updated: $_roundsNum');
    notifyListeners();
  }

  String get enemyName1 => _enemyName1 ?? "";

  String get enemyName2 => _enemyName2 ?? "";

  int get roundsNum => _roundsNum ?? 0;

  void saveFightData() {
    historyController.addFightSession(FightSession(
      date: DateTime.now(),
      winnerName: _enemyName1!,
      loserName: _enemyName2!,
      rounds: _roundsNum!,
    ));
    notifyListeners();
  }
}
