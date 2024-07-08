import 'package:arm_fight_helper/providers/rounds_controller.dart';
import 'package:flutter/material.dart';
import 'package:arm_fight_helper/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final startIndicatorPhaseProvider = ChangeNotifierProvider<StartIndicatorPhaseNotifier>((ref) {
  return StartIndicatorPhaseNotifier(ref.watch(roundsControllerProvider));
});

class StartIndicatorPhaseNotifier extends ChangeNotifier {
  static const List<Phases> phasesSequence = [Phases.start, Phases.preparation, Phases.ready, Phases.go];
  int _currentPhaseIndex = 0;
  final RoundsController _roundsController;
  bool _isDisposed = false;

  get currentPhase => phasesSequence[_currentPhaseIndex];

  StartIndicatorPhaseNotifier(this._roundsController);

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  void nextPhase() {
    if (_currentPhaseIndex + 1 >= phasesSequence.length) {
      throw ErrorDescription("Next phase doesn't exist");
    }

    _currentPhaseIndex++;
    _safeNotifyListeners();
  }

  void previousPhase() {
    if (_currentPhaseIndex - 1 < 0) {
      throw ErrorDescription("Previous phase doesn't exist");
    }

    _currentPhaseIndex--;
    _safeNotifyListeners();
  }

  void movePhase(int step){
    if (_currentPhaseIndex + step < 0 || _currentPhaseIndex + step >= phasesSequence.length) {
      throw ErrorDescription("Phase doesn't exist");
    }
    _currentPhaseIndex += step;
  }

  void endCurrentRound() {
    _currentPhaseIndex = 0;
    _roundsController.endRound();
    _safeNotifyListeners();
  }

  void resetRound() {
    _currentPhaseIndex = 0;
    _safeNotifyListeners();
  }

  void _safeNotifyListeners() {
    if (!_isDisposed) {
      notifyListeners();
    }
  }
}