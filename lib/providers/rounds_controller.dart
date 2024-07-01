import 'package:arm_fight_helper/providers/fight_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/round_model.dart';

final roundsControllerProvider = ChangeNotifierProvider<RoundsController>((ref) {
  return RoundsController(roundsNum: ref.watch(fightControllerProvider).roundsNum);
});

class RoundsController extends ChangeNotifier {
  final List<Round> _rounds = [];
  late int _currentRoundIndex;

  RoundsController({required int roundsNum}) {
    _currentRoundIndex = 0;
    for (int i = 0; i < roundsNum; i++) {
      _rounds.add(Round(false, "None"));
    }
  }

  int get currentRoundIndex => _currentRoundIndex;
  int get roundsNum => _rounds.length;

  // TODO: initialize rounds with constructor (parse roundsNum from settings)

  Round getRound(int index) {
    return _rounds[index];
  }

  // void initialize({required int roundsNum}) {
  //   print("init");
  //   _currentRoundIndex = 0;
  //   for (int i = 0; i < roundsNum; i++) {
  //     _rounds.add(Round(false, "None"));
  //   }
  // }

  void endRound({required String winner}) {
    _rounds[_currentRoundIndex].isEnded = true;
    _rounds[_currentRoundIndex].winner = winner;
    _currentRoundIndex++;
    notifyListeners();
  }




}