class FightSession {
  final String _winner;
  final String _loser;
  final int _rounds;
  final DateTime _date;

  FightSession({
    required String winnerName,
    required String loserName,
    required int rounds,
    required DateTime date,
  })  : _winner = winnerName,
        _loser = loserName,
        _rounds = rounds,
        _date = date;

  get winner => _winner;

  get loser => _loser;

  get rounds => _rounds;

  get date => _date;

  factory FightSession.fromJson(Map<String, dynamic> json) {
    return FightSession(
      winnerName: json['enemyName'],
      loserName: json['enemyName2'],
      rounds: json['rounds'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enemyName': _winner,
      'enemyName2': _loser,
      'rounds': _rounds,
      'date': _date.toIso8601String(),
    };
  }
}
