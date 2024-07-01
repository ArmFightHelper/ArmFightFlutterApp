import 'package:arm_fight_helper/l10n/app_localizations.dart';
import 'package:arm_fight_helper/language_notifier.dart';
import 'package:arm_fight_helper/screeens/competition_screen.dart';
import 'package:arm_fight_helper/screeens/main_screen.dart';
import 'package:arm_fight_helper/widgets/start_indicator_widget.dart';
import 'package:arm_fight_helper/widgets/winner_choise_widget.dart';
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
      title: 'ArmFight Helper',
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
      home: const CompetitionScreen(),
    );
  }


}

void main() {
  testWidgets('Progess indicator color test', (WidgetTester tester) async {
    const int duration = 5;

    await tester.pumpWidget(const ProviderScope(child: TestApp()));
    await tester.pump();

  //   var progressIndicator = tester.firstWidget(find.byType(CircularProgressIndicator)) as CircularProgressIndicator;
  //   expect(progressIndicator.color, const Color(0xff343434));
  //
  //   await tester.runAsync(() async {
  //     await tester.tap(find.byType(StartIndicatorWidget));
  //     await tester.pump(const Duration(seconds: 2));
  //     progressIndicator = tester.firstWidget(find.byType(CircularProgressIndicator)) as CircularProgressIndicator;
  //     expect(progressIndicator.color, const Color(0xffFE9832));
  //   });
  //
  //
  //
  //   await tester.pump(const Duration(seconds: 15));
  //
  //   await tester.runAsync(() async {
  //     await tester.tap(find.byType(ElevatedButton));
  //   });
  //   await tester.pump(const Duration(seconds: 1));
  //
  //   progressIndicator = tester.firstWidget(find.byType(CircularProgressIndicator)) as CircularProgressIndicator;
  //   expect(progressIndicator.color, const Color(0xff343434));


  });


  testWidgets('Blurred staff color test', (WidgetTester tester) async {
    const int duration = 5;

    await tester.pumpWidget(const ProviderScope(child: TestApp()));
    await tester.pump();

    var container = tester.widgetList(
        find.byType(Stack)
    );
    print(container);
    // expect(
    //     container.decoration,
    //     const BoxDecoration(
    //         shape: BoxShape.circle,
    //         color: Color(0xff343434)
    //     )
    // );
    //
    // await tester.tap(find.byType(StartIndicatorWidget));
    // await tester.pump(const Duration(seconds: 3));
    //
    //
    // container = tester.firstWidget(find.byType(Container)) as Container;
    // expect(
    //     container.decoration,
    //     const BoxDecoration(
    //         shape: BoxShape.circle,
    //         color: Color(0xffFE9832)
    //     )
    // );
    //
    // await tester.pump(const Duration(seconds: 10));
    //
    // container = tester.firstWidget(find.byType(Container)) as Container;
    // expect(
    //     container.decoration,
    //     const BoxDecoration(
    //         shape: BoxShape.circle,
    //         color: Color(0xff343434)
    //     )
    // );
  });
}