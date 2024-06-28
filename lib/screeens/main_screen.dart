import 'package:arm_fight_helper/screeens/competition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'history_screen.dart';
import 'package:arm_fight_helper/theme.dart'; // Ensure this import points to the correct path of your theme file

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeColors = Theme.of(context).extension<ThemeColors>()!;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 250),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColors.mainMenuButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SettingsScreen(),
                  );
                },
                child: Text(
                  "Competition",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColors.mainMenuButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SettingsScreen(),
                  );
                },
                child: Text(
                  "Training",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  ),
                  onPressed: () {
                    ref.read(themeProvider.notifier).toggleTheme();
                  },
                  child: Icon(
                    Icons.brightness_6,
                    color: colorScheme.primary,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HistoryScreen()),
                    );
                  },
                  child: Text(
                    "History",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  ),
                  onPressed: () {
                    ref.read(languageProvider.notifier).toggleLanguage();
                  },
                  child: Icon(
                    Icons.language,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Center(
        child: ElevatedButton(
          child: Text("WIP: go to competition"),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CompetitionScreen()),
            );
          },


        ),
      ),
    );
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>((ref) {
  return LanguageNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(buildLightTheme());

  void toggleTheme() {
    state = state.brightness == Brightness.light ? buildDarkTheme() : buildLightTheme();
  }
}

class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier() : super(Locale('en'));

  void toggleLanguage() {
    state = state.languageCode == 'en' ? Locale('es') : Locale('en');
  }
}