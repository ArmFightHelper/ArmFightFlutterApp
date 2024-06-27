import 'package:arm_fight_helper/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Example")),
            SizedBox(height: 20),
            Text("data"),
            OutlinedButton(onPressed: () {}, child: Text("some text")),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(
                    Theme.of(context).extension<ThemeColors>()!.mainMenuButtonColor
                )
              ),
                onPressed: () {},
                child: const Text("asd")
            ),
          ],


        ) ,
      )
      
      
    );
  }

}