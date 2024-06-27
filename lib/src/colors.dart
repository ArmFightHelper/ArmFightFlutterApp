import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class DarkThemeColors {
  static const background = Color(0xff222222);
  static const ready = Color(0xffFE9832);
  static const go = Color(0xff34FF3C);
  static const timerProgress = Color(0xff343434);
  static const inactiveRound = Color(0xff6F6F70);
  static const menuRedButtons = Color(0xffFF3434);
  static const textColor = Colors.white;
}

abstract class LightThemeColors {
  static const background = Color(0xffffffff);
  static const ready = Color(0xffFE9832);
  static const go = Color(0xff2FE937);
  static const timerProgress = Color(0xffD8D8D8);
  static const inactiveRound = Color(0xffD8D8D8);
  static const menuRedButtons = Color(0xffFF3434);
  static const textColor = Color(0xff222222);
}