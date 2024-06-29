import 'dart:ui';

import 'package:arm_fight_helper/theme.dart';
import 'package:flutter/material.dart';

enum Phases {
  start,
  preparation,
  ready,
  go;

  static Color toColor({required BuildContext context, required Phases phase}) {
    switch (phase) {
    case Phases.start:
      return Theme.of(context).colorScheme.secondary;
    case Phases.preparation:
      return Theme.of(context).colorScheme.secondary;
    case Phases.ready:
      return Theme.of(context).extension<ThemeColors>()!.readyColor;
    case Phases.go:
      return Theme.of(context).extension<ThemeColors>()!.goColor;
    default:
      throw ErrorDescription("Got unknown phase type or null");
  }


  }
}