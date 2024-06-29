class FightSession {
  final String _id;
  final String _enemyName;
  final String _enemyName2;
  final int _rounds;
  final DateTime _date;

  FightSession({
    required String id,
    required String enemyName,
    required String enemyName2,
    required int rounds,
    required DateTime date,
  })  : _id = id,
        _enemyName = enemyName,
        _enemyName2 = enemyName2,
        _rounds = rounds,
        _date = date;

  get id => _id;

  get enemyName => _enemyName;

  get enemyName2 => _enemyName2;

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
      'enemyName': _enemyName,
      'enemyName2': _enemyName2,
      'rounds': _rounds,
      'date': _date.toIso8601String(),
    };
  }
}
