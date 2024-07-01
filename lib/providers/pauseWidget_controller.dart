
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pauseProvider = ChangeNotifierProvider<PauseNotifier>((ref){
  return PauseNotifier();
});

class PauseNotifier extends ChangeNotifier{
  IconData _icon = Icons.accessible;
  get icon => _icon;
  set icon(newIcon) => _icon = newIcon;
  void doNotify(newIcon){
    icon = newIcon;
    notifyListeners();
  }
}