import 'package:random_color/random_color.dart';
import 'package:flutter/material.dart';

class ColorRand {
  List<Color> gencolors = [];

  ColorRand() {
    for (int i = 0; i <= 50; i++) {
      RandomColor _randomColor = RandomColor();
      Color _color =
      _randomColor.randomColor(colorBrightness: ColorBrightness.light);

      gencolors.add(_color);
    }
  }
}
