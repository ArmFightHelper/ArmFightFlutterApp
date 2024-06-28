import 'package:arm_fight_helper/screeens/competition_screen.dart';
import 'package:arm_fight_helper/screeens/main_screen.dart';
import 'package:arm_fight_helper/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'language_notifier.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final locale = ref.watch(languageProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ArmFight Helper',
      theme: theme,
      locale: locale,
      supportedLocales: [
        Locale('en'),
        Locale('ru'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: MainScreen(),
    );
  }
}