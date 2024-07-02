import 'dart:math';
import 'package:arm_fight_helper/providers/phase_controller.dart';
import 'package:arm_fight_helper/providers/rounds_controller.dart';
import 'package:arm_fight_helper/providers/timer_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'package:intl/intl.dart';
import 'package:audioplayers/audioplayers.dart';

class StartIndicatorWidget extends ConsumerWidget {
  static AudioPlayer player = new AudioPlayer();
  const StartIndicatorWidget({super.key});

  void playReadySound() async {
    await player.play(AssetSource('sounds/ready.mp3'));
  }

  void playGoSound() async {
    await player.play(AssetSource('sounds/cs-go-flashbang.mp3'));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(startIndicatorPhaseProvider).currentPhase == Phases.ready) {
      playReadySound();
    }

    if (ref.watch(startIndicatorPhaseProvider).currentPhase == Phases.go) {
      playGoSound();
    }

    return GestureDetector(
      onTap: () async {
        if (ref.watch(startIndicatorPhaseProvider).currentPhase == Phases.start
            && ref.watch(roundsControllerProvider).currentRoundIndex != ref.watch(roundsControllerProvider).roundsNum
        ) {
          ref.read(startIndicatorPhaseProvider).nextPhase();
          ref.read(timerProvider).startTimer();
        }

      },

      child: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            children: <Widget>[
              Container(
                key: Key("blurred_stuff"),
                height: 155,
                width: 155,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Phases.toColor(context: context, phase: ref.watch(startIndicatorPhaseProvider).currentPhase)
                )
              ),

              Positioned.fill(
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(
                      sigmaX: 26.0,
                      sigmaY: 26.0,
                    ),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  )
              ),



            ],
          ),


          SizedBox(
            width: 260,
            height: 260,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0,
                end: ref.watch(timerProvider).timeLeft / ref.watch(timerProvider).totalTime,
              ),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                return CircularProgressIndicator(
                  value: value,
                  strokeWidth: 13,
                  color: Phases.toColor(context: context, phase: ref.watch(startIndicatorPhaseProvider).currentPhase),
                );
              },
            ),
          ),

          CustomPaint(
            size: Size(228, 228),
            foregroundPainter: CircleDashPainter(
                srokesNum: 50,
                strokeWidth: 3,
                color: Theme.of(context).colorScheme.secondary
            ),
          ),

          Text(
            switch (ref.watch(startIndicatorPhaseProvider).currentPhase) {
              Phases.start => "START",
              Phases.ready => "READY",
              Phases.go => "GO",
              Phases.preparation => DateFormat("mm:ss").format(
                  DateTime(
                      0, 0, 0, 0,
                      ref.watch(timerProvider).timeLeft ~/ 60,
                      ref.watch(timerProvider).timeLeft % 60
                  )
              ),
              Object() => throw UnimplementedError(),
              null => throw UnimplementedError(),
            },
            style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.headlineLarge,
            ),

          )




        ],
      ),
    );
  }
}


class CircleDashPainter extends CustomPainter {
  Color color;
  double strokeWidth;
  int srokesNum;

  CircleDashPainter(
      { required this.color, required this.strokeWidth, required this.srokesNum});

  @override
  void paint(Canvas canvas, Size size) {
    Paint complete = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    double arcAngle = pi / (srokesNum);

    for (var i = 0; i < (srokesNum * 2); i++) {
      var init = i*(2* pi / srokesNum);

      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          init, arcAngle, false, complete);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}