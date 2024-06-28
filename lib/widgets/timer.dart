import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeCountWidget extends ConsumerWidget{
  const TimeCountWidget({super.key});

  final int timeLeft = 60;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      "${(timeLeft~/60).toString().padLeft(2, '0')}:${(timeLeft%60).toString().padLeft(2, '0')}",
      style: GoogleFonts.inter(
          textStyle: Theme.of(context).textTheme.headlineMedium
      ),
    );
  }

}