import 'package:flutter/material.dart';
import 'package:arm_fight_helper/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final startIndicatorPhaseProvider = ChangeNotifierProvider<StartIndicatorPhaseNotifier>((ref) {
  return StartIndicatorPhaseNotifier();
});

class StartIndicatorPhaseNotifier extends ChangeNotifier {
  static const List<Phases> phasesSequence = [Phases.start, Phases.preparation, Phases.ready, Phases.go];
  int _currentPhaseIndex = 0;

  get currentPhase => phasesSequence[_currentPhaseIndex];

  void nextPhase() {
    if (_currentPhaseIndex + 1 >= phasesSequence.length) {
      throw ErrorDescription("Next phase doesn't exist");
    }

    _currentPhaseIndex++;
    notifyListeners();
  }

  void previousPhase() {
    if (_currentPhaseIndex - 1 < 0) {
      throw ErrorDescription("Previous phase doesn't exist");
    }

    _currentPhaseIndex--;
    notifyListeners();
  }

  void reset() {
    _currentPhaseIndex = 0;
    notifyListeners();
  }
}