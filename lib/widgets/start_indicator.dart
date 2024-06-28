import 'dart:math';

import 'package:arm_fight_helper/theme.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:google_fonts/google_fonts.dart';


class StartIndicatorWidget extends ConsumerWidget {
  const StartIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Stack(
          children: <Widget>[
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).extension<ThemeColors>()!.readyColor
              )
            ),

            Positioned.fill(
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(
                    sigmaX: 25.0,
                    sigmaY: 25.0,
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
          child: CircularProgressIndicator(
            value: 1,
            strokeWidth: 13,
            color: Theme.of(context).colorScheme.secondary,
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
          "READY",
          style: GoogleFonts.inter(
            textStyle: Theme.of(context).textTheme.headlineLarge,
          ),

        )




      ],
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