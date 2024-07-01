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
  VoidCallback? onGoPhaseReached;

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

    if (currentPhase == Phases.go && onGoPhaseReached != null) {
      onGoPhaseReached!();
    }
  }

  void previousPhase() {
    if (_currentPhaseIndex - 1 < 0) {
      throw ErrorDescription("Previous phase doesn't exist");
    }
    _currentPhaseIndex--;
    _safeNotifyListeners();
  }

  void endCurrentRound() {
    _currentPhaseIndex = 0;
    _roundsController.endRound(winner: "winner");
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