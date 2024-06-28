import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'indicator_phase.dart';

final timerProvider = ChangeNotifierProvider<TimerNotifier>((ref) {
  return TimerNotifier(ref.watch(startIndicatorPhaseProvider));
});

class TimerNotifier with ChangeNotifier {
  late PausableTimer _timer;
  int _timerValue = 0;
  int _totalTime = 0;
  bool _onPause = true;
  StartIndicatorPhaseNotifier _startIndicatorPhaseNotifier;

  get timeLeft => _timerValue;

  TimerNotifier(this._startIndicatorPhaseNotifier) {
    initializeTimer(timePeriod: 4);
  }


  void initializeTimer({required int timePeriod}) async {
    int _timeLeft = timePeriod;
    _timerValue = timePeriod;

    _timer = PausableTimer.periodic(
        const Duration(seconds: 1),
            () {
          if (_timeLeft == 0) {
            _timer.pause();
            _timer.reset();
            _timeLeft = timePeriod;
            _timerValue = timePeriod;

            _startIndicatorPhaseNotifier.nextPhase();
            return;
            // Proceed to next phase
          }
          _timeLeft--;
          _totalTime++;
          _timerValue = _timeLeft;
          notifyListeners();
        }
    );
  }

  void startTimer() {
    if (_onPause) {
      _onPause = false;
      _timer.start();
    }
  }

  void pauseTimer() {
    _onPause = true;
    _timer.pause();
  }

  void stopTimer() {
    _onPause = true;
    _timer.pause();
    _timer.cancel();
  }
}