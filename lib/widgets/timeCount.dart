import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arm_fight_helper/providers/timer_controller.dart';

import '../providers/phase_controller.dart';
import '../providers/random_timer_controller.dart';

class TimeCountWidget extends ConsumerWidget{
  //int timeLeft;
  late ChangeNotifierProvider<TimerNotifier> currentTimeProvider;
  TimeCountWidget({super.key, required this.currentTimeProvider});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ref.read(currentTimeProvider).startTimer();
    ref.watch(currentTimeProvider).timeLeft;
    //ref.read(timerProvider).initializeCountDown(timePeriod: timeLeft);
    return Text(
      "${((ref.watch(currentTimeProvider.notifier).timeLeft)~/60).toString().padLeft(2, '0')}:${((ref.watch(currentTimeProvider.notifier).timeLeft)%60).toString().padLeft(2, '0')}",
      style: GoogleFonts.inter(
          textStyle: Theme.of(context).textTheme.headlineMedium
      ),
    );
  }

}