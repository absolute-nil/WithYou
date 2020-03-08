import 'package:flutter/material.dart';

class GameButton  {
  final id;
  String text;
  Color color;
  bool enabled;

  GameButton({this.id, this.text = "", this.color, this.enabled = true});
}