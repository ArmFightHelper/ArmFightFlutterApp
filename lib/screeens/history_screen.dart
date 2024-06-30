import 'package:arm_fight_helper/models/fight_session_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arm_fight_helper/widgets/fight_session_widget.dart';
import 'package:arm_fight_helper/providers/history_controller.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyController = ref.watch(historyControllerProvider);
    final sessions = historyController.sessions;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(
                    onPressed: () {
                      historyController.addFightSession(FightSession(
                          id: "ffafs",
                          enemyName: "REsere",
                          enemyName2: "refsf",
                          rounds: 3,
                          date: DateTime.now()));
                    },
                    child: Text("Add Sesion")),
                const Center(
                  child: Text(
                    'Fight History',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ]),
              Expanded(
                child: ListView.builder(
                  itemCount: sessions.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        FightCard(session: sessions[index]),
                        const SizedBox(height: 21.0), // Adjust the value as needed
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
