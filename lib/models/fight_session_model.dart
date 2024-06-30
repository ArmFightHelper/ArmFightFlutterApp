class FightSession {
  final String _id;
  final String _winner;
  final String _loser;
  final int _rounds;
  final DateTime _date;

  FightSession({
    required String id,
    required String enemyName,
    required String enemyName2,
    required int rounds,
    required DateTime date,
  })  : _id = id,
        _winner = enemyName,
        _loser = enemyName2,
        _rounds = rounds,
        _date = date;

  get id => _id;

  get winner => _winner;

  get loser => _loser;

  get rounds => _rounds;

  get date => _date;

  factory FightSession.fromJson(Map<String, dynamic> json) {
    return FightSession(
      id: json['id'],
      enemyName: json['enemyName'],
      enemyName2: json['enemyName2'],
      rounds: json['rounds'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'enemyName': _winner,
      'enemyName2': _loser,
      'rounds': _rounds,
      'date': _date.toIso8601String(),
    };
  }
}
