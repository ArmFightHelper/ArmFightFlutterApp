import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arm_fight_helper/widgets/fight_session.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Fight History',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ]
              ),
              SizedBox(height: 16.0),
              FightCard(
                fighter1: 'John Doe',
                fighter2: 'Jane Doe',
                date: 'Jun 13 2024',
              ),
              SizedBox(height: 16.0),
              FightCard(
                fighter1: 'John Doe',
                fighter2: 'Jane Doe',
                date: 'Jun 13 2024',
              ),
              SizedBox(height: 16.0),
              FightCard(
                fighter1: 'John Doe',
                fighter2: 'Jane Doe',
                date: 'Jun 13 2024',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

