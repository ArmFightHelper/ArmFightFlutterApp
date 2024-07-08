import 'package:arm_fight_helper/l10n/app_localizations.dart';
import 'package:arm_fight_helper/language_notifier.dart';
import 'package:arm_fight_helper/screeens/competition_settings_screen.dart';
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
      title: 'ArmFight Helper',
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
      home: const MainScreen(),
    );
  }


}

void main() {
  testWidgets('Start indicator test', (WidgetTester tester) async {
    const int duration = 5;

    await tester.pumpWidget(const ProviderScope(child: TestApp()));
    await tester.pump();


    await tester.tap(find.text("Competition"));
    await tester.pump();
    // await tester.enterText(find.byKey(const Key("name_1")), "name_1");
    // await tester.enterText(find.byKey(const Key("name_2")), "name_2");
    // await tester.enterText(find.byKey(const Key("rounds_num")), "1");

    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(Key("go_to_competition")));
    await tester.tap(find.byKey(Key("go_to_competition")));
    await tester.pumpAndSettle(Duration(seconds: 1));

    expect(find.byType(CircularProgressIndicator), findsOne);

    await tester.tap(find.byType(StartIndicatorWidget));

    await tester.pump(Duration(seconds: 8));

    var progressIndicator = tester.firstWidget(find.byType(CircularProgressIndicator)) as CircularProgressIndicator;
    expect(progressIndicator.color, const Color(0xff343434));

    var container = tester.firstWidget(find.byKey(Key("blurred_stuff"))) as Container;
    expect(
        container.decoration,
        const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff343434)
        )
    );

    await tester.pump(const Duration(seconds: 3));

    progressIndicator = tester.firstWidget(find.byType(CircularProgressIndicator)) as CircularProgressIndicator;
    expect(progressIndicator.color, const Color(0xffFE9832));

    container = tester.firstWidget(find.byKey(Key("blurred_stuff"))) as Container;
    expect(
        container.decoration,
        const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffFE9832)
        )
    );

    await tester.pump(const Duration(seconds: 10));

    progressIndicator = tester.firstWidget(find.byType(CircularProgressIndicator)) as CircularProgressIndicator;
    expect(progressIndicator.color, const Color(0xff343434));

    container = tester.firstWidget(find.byKey(Key("blurred_stuff"))) as Container;
    expect(
        container.decoration,
        const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff343434)
        )
    );

    await tester.pump(const Duration(seconds: 1));
  });
}