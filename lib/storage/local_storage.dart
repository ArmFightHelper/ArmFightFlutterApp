import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arm_fight_helper/models/fight_session_model.dart';

abstract class FightSessionLocalStorageSource {

  Future<List<FightSession>> getFightSession();

  Future<void> saveFightSession(List<FightSession> sessions);
}

class FightSessionStorage implements FightSessionLocalStorageSource {
  static const String _sessionsKey = 'sessions';

  /// Retrieves a list of [FightSession] objects from local storage.
  ///
  /// This function retrieves the list of [FightSession] objects stored in local storage.
  /// It first retrieves the shared preferences instance using [SharedPreferences.getInstance()].
  /// Then, it retrieves the JSON string representing the list of [FightSession] objects from the shared preferences using the key [_sessionsKey].
  /// If the JSON string is null, indicating that there are no sessions, an empty list is returned.
  /// Otherwise, the JSON string is decoded into a list of [FightSession] objects using [json.decode()] and [FightSession.fromJson()].
  /// The resulting list of [FightSession] objects is then returned.
  ///
  /// Returns a [Future] that completes with a list of [FightSession] objects retrieved from local storage.
  @override
  Future<List<FightSession>> getFightSession() async {
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

  /// Saves a list of [FightSession] objects to local storage.
  ///
  /// The [sessions] parameter is a list of [FightSession] objects to be saved.
  /// Each [FightSession] object is converted to JSON format using [FightSession.toJson()].
  /// The resulting JSON string is then stored in local storage using [SharedPreferences.setString()].
  ///
  /// Returns a [Future<void>] that completes when the save operation is complete.
  @override
  Future<void> saveFightSession(List<FightSession> sessions) async {
    final prefs = await SharedPreferences.getInstance();
    final sessionsJson = json.encode(sessions.map((session) => session.toJson()).toList());
    await prefs.setString(_sessionsKey, sessionsJson);
  }
}
