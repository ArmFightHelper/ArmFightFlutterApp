import 'package:arm_fight_helper/screeens/competition_screen.dart';
import 'package:arm_fight_helper/screeens/main_screen.dart';
import 'package:arm_fight_helper/widgets/start_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestApp extends ConsumerWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'ArmFight Helper',
      home: const CompetitionScreen(),
    );
  }


}

void main() {
  testWidgets('Timer countdown test', (WidgetTester tester) async {
    const int duration = 5;

    await tester.pumpWidget(const ProviderScope(child: TestApp()));
    await tester.pump();

    expect(find.text("START"), findsOne);
    await tester.tap(find.byType(StartIndicatorWidget));

    await tester.pump(const Duration(seconds: 1));
    expect(find.text("00:00"), findsOne);
    await tester.pump(const Duration(seconds: 3));
    expect(find.text("READY"), findsOne);

    await tester.pump(const Duration(seconds: 7));
    expect(find.text("START"), findsOne);
    await tester.pump(const Duration(seconds: 1));
  });



}