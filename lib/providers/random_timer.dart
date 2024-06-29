import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'indicator_phase.dart';

final randomTimerProvider = ChangeNotifierProvider<RandomTimerNotifier>((ref) {
  return RandomTimerNotifier(ref.watch(startIndicatorPhaseProvider));
});

class RandomTimerNotifier with ChangeNotifier {
  static const int _tick = 250; // In milliseconds

  late PausableTimer _timer;
  int _timerTicks = 0;
  final StartIndicatorPhaseNotifier _startIndicatorPhaseNotifier;

  get timeLeft => _timerTicks;

  RandomTimerNotifier(this._startIndicatorPhaseNotifier) {
    initializeTimer(timePeriod: 5);
  }


  void initializeTimer({required int timePeriod}) async {
    _timerTicks = timePeriod * (1000 ~/ _tick);
    int randomFlag;

    _timer = PausableTimer.periodic(
        const Duration(milliseconds: _tick),
            () async {
          if (_timerTicks <= 0) {
            _timer.pause();
            _timer.reset();
            _timerTicks = timePeriod * (1000 ~/ _tick);
            print("GO on $_timerTicks");

            _startIndicatorPhaseNotifier.nextPhase();
            await Future.delayed(Duration(seconds: 2));
            _startIndicatorPhaseNotifier.reset();
            return;
          }

          randomFlag = Random().nextInt(9); // 10% chance for every tick
          // randomFlag = Random().nextInt(99); // 1% chance for every tick

          if (randomFlag == 1) {
            print("GO on ${_timerTicks * _tick / 1000}");

            _timerTicks = timePeriod * (1000 ~/ _tick);
            _timer.pause();
            _timer.reset();

            _startIndicatorPhaseNotifier.nextPhase();
            await Future.delayed(Duration(seconds: 2));
            _startIndicatorPhaseNotifier.reset();
          } else {
            _timerTicks--;
            print(_timerTicks * _tick / 1000);
          }
        }

    );
  }

  void startTimer() async {
    // TODO: get from settings
    await Future.delayed(Duration(seconds: 2));
    _timer.start();
  }


  void stopTimer() {
    print(_timer.hashCode);
    _timer.pause();
    _timer.reset();
  }
}