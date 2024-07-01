import 'package:arm_fight_helper/l10n/app_localizations.dart';
import 'package:arm_fight_helper/language_notifier.dart';
import 'package:arm_fight_helper/screeens/competition_screen.dart';
import 'package:arm_fight_helper/screeens/main_screen.dart';
import 'package:arm_fight_helper/widgets/rounds_indicator_widget.dart';
import 'package:arm_fight_helper/widgets/start_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestApp extends ConsumerWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final locale = ref.watch(languageProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      locale: locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
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
            color: Color(0xff6F6F70)
        )
    );

    await tester.tap(find.byType(StartIndicatorWidget));
    await tester.pump(const Duration(seconds: 11));


    firstRound = tester.firstWidget(find.descendant(of: find.byType(Wrap), matching: find.byType(Container))) as Container;
    expect(
        firstRound.decoration,
        const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xfffe9832)
        )
    );

    await tester.pump();
    var rounds = tester.widgetList(find.descendant(of: find.byType(Wrap), matching: find.byType(Container)));
    expect(
        (rounds.elementAt(1) as Container).decoration,
        const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff6F6F70)
        )
    );

    await tester.tap(find.byType(StartIndicatorWidget));
    await tester.pump(const Duration(seconds: 11));

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