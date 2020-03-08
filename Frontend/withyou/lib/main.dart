import 'package:flutter/material.dart';
import 'package:withyou/Pages/home.dart';
import 'package:withyou/Pages/loading.dart';
import 'package:withyou/Pages/login.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:withyou/Pages/tictac.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.dark,
      data: (brightness) => new ThemeData(
          primarySwatch: Colors.lightGreen,
          brightness: brightness,
        ),
      themedWidgetBuilder: (context,theme)=>MaterialApp(
        routes: {
          '/home':(context)=>HomePage(),
          '/loading':(context)=>LoadingPage(),
          '/login':(context)=>LoginPage(),
          '/game':(context)=>TicTacToe(),
        },
        debugShowCheckedModeBanner: false,
        title: 'WithYou',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: LoginPage(),
      ),
    );
  }
}
