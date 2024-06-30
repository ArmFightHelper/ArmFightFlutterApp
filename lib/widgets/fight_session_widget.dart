import 'package:flutter/material.dart';
import 'package:arm_fight_helper/models/fight_session_model.dart';
import 'package:intl/intl.dart';

class FightCard extends StatelessWidget {
  final FightSession _session;

  FightCard({super.key, required FightSession session}) : _session = session;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 74,
      width: 356,
      padding: EdgeInsets.all(21.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/icons/arrow.png',
                height: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 18.0),
            Image.asset('assets/icons/rectangle.png',
                height: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 13.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${_session.winner}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      const Text(" vs ",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("${_session.loser}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.red))
                    ],
                  ),
                )
              ],
            ),
            Spacer(),
            Image.asset('assets/icons/rectangle.png',
                height: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 13.0),
            Image.asset('assets/icons/calendar.png',
                height: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 5.0),
            Flexible(
              child: Text(
                softWrap: true,
                DateFormat.yMMMd().format(_session.date),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
