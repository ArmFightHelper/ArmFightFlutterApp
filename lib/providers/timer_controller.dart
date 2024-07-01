import 'package:arm_fight_helper/providers/random_timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'phase_controller.dart';

final timerProvider = ChangeNotifierProvider<TimerNotifier>((ref) {
  return TimerNotifier(
    ref.watch(startIndicatorPhaseProvider),
    ref.watch(randomTimerProvider)
  );
});

class TimerNotifier with ChangeNotifier {
  late PausableTimer _timer;
  late int _timerValue;
  late int _totalTime;
  bool _onPause = true;
  final StartIndicatorPhaseNotifier _startIndicatorPhaseNotifier;
  final RandomTimerNotifier _randomTimerNotifier;

  get timeLeft => _timerValue;
  get totalTime => _totalTime;

  TimerNotifier(this._startIndicatorPhaseNotifier, this._randomTimerNotifier) {
    initializeTimer(timePeriod: 1);
    // TODO: get from settings
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }


  void initializeTimer({required int timePeriod}) async {
    int timeLeft = timePeriod;
    _timerValue = timePeriod;
    _totalTime = timePeriod;

    // TOD0: increase prep phase
    _timer = PausableTimer.periodic(
        const Duration(seconds: 1),
            () {
          if (timeLeft == 0) {
            _timer.pause();
            _timer.reset();
            timeLeft = timePeriod;
            _timerValue = timePeriod;

            _startIndicatorPhaseNotifier.nextPhase();
            _randomTimerNotifier.startTimer();
            return;
            // Proceed to next phase
          }
          timeLeft--;
          _totalTime++;
          _timerValue = timeLeft;
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
    _timer.reset();
  }
}