import 'package:flutter/material.dart';


class FightCard extends StatelessWidget {
  final String fighter1;
  final String fighter2;
  final String date;

  FightCard({required this.fighter1, required this.fighter2, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(Icons.sports_kabaddi),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$fighter1 vs $fighter2',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                'Jun 13 2024',
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.calendar_today),
        ],
      ),
    );
  }
}
