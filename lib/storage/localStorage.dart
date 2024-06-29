import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arm_fight_helper/models/models.dart';

abstract class FightSessionLocalStorageSource {
  Future<List<FightSession>> getShowerSessions();

  Future<void> saveShowerSessions(List<FightSession> sessions);
}

class FightSessionStorage implements FightSessionLocalStorageSource {
  static const String _sessionsKey = 'sessions';

  @override
  Future<List<FightSession>> getShowerSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final sessionsJson = prefs.getString(_sessionsKey);

    if (sessionsJson == null) {
      // If there are no sessions, return an empty list
      return [];
    }
    return json
        .decode(sessionsJson)
        .map<FightSession>((json) => FightSession.fromJson(json))
        .toList();
  }

  @override
  Future<void> saveShowerSessions(List<FightSession> sessions) async {
    final prefs = await SharedPreferences.getInstance();
    final sessionsJson = json.encode(sessions.map((session) => session.toJson()).toList());
    await prefs.setString(_sessionsKey, sessionsJson);
  }
}
