import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pausable_timer/pausable_timer.dart';

final timerProvider = ChangeNotifierProvider<TimerNotifier>((ref) {
  return TimerNotifier();
});

class TimerNotifier with ChangeNotifier {
  late PausableTimer _timer;
  int _timerValue = 0;
  int _totalTime = 0;
  bool _onPause = true;


  void initializeTimer({required int phasesNum, required int timePeriod}) async {
    int _timeLeft = timePeriod;
    _timerValue = timePeriod;

    _timer = PausableTimer.periodic(
        const Duration(seconds: 1),
            () {
          if (_timeLeft == 0) {
            _timer.pause();
          }
          _timeLeft--;
          _totalTime++;
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