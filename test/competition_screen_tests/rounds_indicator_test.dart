import 'package:arm_fight_helper/screeens/competition_screen.dart';
import 'package:arm_fight_helper/screeens/main_screen.dart';
import 'package:arm_fight_helper/widgets/rounds_indicator_widget.dart';
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
  testWidgets('Rounds indicator test', (WidgetTester tester) async {
    const int duration = 5;

    await tester.pumpWidget(const ProviderScope(child: TestApp()));
    await tester.pump();

    expect(find.byType(RoundsWidget), findsOne);
    var firstRound = tester.firstWidget(find.descendant(of: find.byType(Wrap), matching: find.byType(Container))) as Container;
    expect(
        firstRound.decoration,
        const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffD8D8D8)
        )
    );

    await tester.tap(find.byType(StartIndicatorWidget));
    await tester.pump(const Duration(seconds: 15));


    var rounds = tester.widgetList(find.descendant(of: find.byType(Wrap), matching: find.byType(Container)));
    expect(
        (rounds.elementAt(0) as Container).decoration,
        const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xfffe9832)
        )
    );

    await tester.pump();
    rounds = tester.widgetList(find.descendant(of: find.byType(Wrap), matching: find.byType(Container)));
    expect(
        (rounds.elementAt(1) as Container).decoration,
        const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffD8D8D8)
        )
    );

    await tester.tap(find.byType(StartIndicatorWidget));
    await tester.pump(const Duration(seconds: 13));

    rounds = tester.widgetList(find.descendant(of: find.byType(Wrap), matching: find.byType(Container)));
    expect(
        (rounds.elementAt(1) as Container).decoration,
        const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xfffe9832)
        )
    );

  });
}