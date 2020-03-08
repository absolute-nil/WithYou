import 'package:flutter/material.dart';
import 'dart:async';

loadMainPage(BuildContext context) {
  Navigator.pushNamed(context, '/loading');
  Timer(Duration(seconds: 4),
      () => Navigator.pushReplacementNamed(context, '/home'));
}
