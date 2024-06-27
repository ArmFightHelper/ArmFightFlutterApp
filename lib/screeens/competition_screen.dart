import 'package:arm_fight_helper/widgets/pause_button.dart';
import 'package:arm_fight_helper/widgets/rounds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arm_fight_helper/widgets/start_indicator.dart';

class CompetitionScreen extends ConsumerWidget {
  const CompetitionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Competition",
          style: GoogleFonts.inter(
            textStyle: Theme.of(context).textTheme.headlineMedium
          ),
        ),
        centerTitle: true,
      ),
      
      
      body: const Center(
        child: Column(
            children: [
              SizedBox(height: 40),
              StartIndicatorWidget(),
              RoundsWidget(),
              Expanded(child: SizedBox()),
              PauseButtonWidget()
            ],
        ),
      ),
    );
  }

}