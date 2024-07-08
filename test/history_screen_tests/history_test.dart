import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:arm_fight_helper/screeens/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:arm_fight_helper/providers/history_controller.dart';
import 'package:arm_fight_helper/models/fight_session_model.dart';

class TestWidget extends ConsumerWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    addFightSession(ref);
    return MaterialApp(
      home: const HistoryScreen(),
    );
  }
}

void addFightSession(WidgetRef ref){
  ref.watch(historyControllerProvider.notifier).addFightSession(
    FightSession(
      winnerName: "John",
      loserName: "Doe",
      rounds: 3,
      date: DateTime.now(),
    )
  );

  ref.watch(historyControllerProvider.notifier).addFightSession(
      FightSession(
        winnerName: "Aleph",
        loserName: "Deliri",
        rounds: 7,
        date: DateTime.now(),
      )
  );
}

void main() {
  testWidgets('Fight History screen test', (WidgetTester tester) async {
    
    await tester.pumpWidget(MaterialApp(
      home: ProviderScope(child: TestWidget()),
    ));

    // Verify that the text "Fight session" is found.
    expect(find.text('Fight History'), findsOneWidget);

    expect(find.text("John"), findsOneWidget);
    expect(find.text("Doe"), findsOneWidget);

    expect(find.text("Aleph"), findsOneWidget);
    expect(find.text("Deliri"), findsOneWidget);


  });
}