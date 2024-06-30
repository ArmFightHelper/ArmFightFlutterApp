import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arm_fight_helper/storage/local_storage.dart';
import 'package:arm_fight_helper/models/fight_session_model.dart';

// To add new session
// historyController.addFightSession(FightSession(
//                           id: "ffafs",
//                           enemyName: "REsere",
//                           enemyName2: "refsf",
//                           rounds: 3,
//                           date: DateTime.now()));
//                     }

final localStorageProvider = Provider<FightSessionStorage>((ref) {
  return FightSessionStorage();
});

final historyControllerProvider = ChangeNotifierProvider<HistoryController>((ref) {
  final localStorage = ref.watch(localStorageProvider);
  return HistoryController(localStorage);
});

class HistoryController extends ChangeNotifier {
  final FightSessionStorage _fightSessionStorage;
  List<FightSession> _sessions = [];

  HistoryController(this._fightSessionStorage) : super() {
    getFightSessions();
  }

  List<FightSession> get sessions => _sessions;

  Future<void> getFightSessions() async {
    _sessions = await _fightSessionStorage.getFightSession();
    notifyListeners();
  }

  Future<void> addFightSession(FightSession session) async {
    _sessions.add(session);
    await saveFightSession(_sessions);
    notifyListeners();
  }

  Future<void> saveFightSession(List<FightSession> sessions) async {
    await _fightSessionStorage.saveFightSession(sessions);
    notifyListeners();
  }
}
