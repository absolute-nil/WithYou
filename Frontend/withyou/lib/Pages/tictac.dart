import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:withyou/models/tictac.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<GameButton> gameButtons;
  var player1;

  var player2;

  var activePlayer;

  @override
  void initState() {
    super.initState();
    gameButtons = _initButtons();
  }

  List<GameButton> _initButtons() {
    player1 = new List();
    player2 = new List();
    activePlayer = 1;
    List<GameButton> buttons = [];
    for (var i = 0; i < 9; i++) {
      buttons.add(GameButton(id: i + 1));
    }
    return buttons;
  }

  _playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.color = Colors.red;
        player1.add(gb.id);
        activePlayer = 2;
      } else {
        gb.text = "0";
        gb.color = Colors.black;
        player2.add(gb.id);
        activePlayer = 1;
      }
      gb.enabled = false;
      int winner = _checkWinner();
      if (winner == -1) {
        if (gameButtons.every((p) => p.text != "")) {
          _showResetMessage(context, "Game tied");
        } else {
          activePlayer == 2 ? _autoPlay() : null;
        }
      }
    });
  }

  void _autoPlay() {
    var emptyCells = new List();
    var list = new List.generate(9, (i) => i + 1);
    for (var cellId in list) {
      if (!(player1.contains(cellId) || player2.contains(cellId))) {
        emptyCells.add(cellId);
      }
    }
    var r = new Random();
    var randIndex = r.nextInt(emptyCells.length - 1);
    var cellId = emptyCells[randIndex];
    int i = gameButtons.indexWhere((p) => p.id == cellId);
    _playGame(gameButtons[i]);
  }

  int _checkWinner() {
    var winner = -1;
    //check horizontal possibilities
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }
    //check vertical possibilities
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }
    //check diagonal possibilities
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }
    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }
    if (winner != -1) {
      _showResetMessage(context, "Player $winner won");
    }
    return winner;
  }

  void _resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      gameButtons = _initButtons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tic Tac Toe"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: gameButtons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0),
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: RaisedButton(
                        onPressed: gameButtons[index].enabled
                            ? () => _playGame(gameButtons[index])
                            : null,
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          gameButtons[index].text,
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                        color: gameButtons[index].color,
                        disabledColor: gameButtons[index].color,
                      ),
                    );
                  }),
            ),
            RaisedButton(
              onPressed: _resetGame,
              color: Colors.red,
              child: Text(
                "Reset",
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
              padding: const EdgeInsets.all(8.0),
            )
          ],
        ));
  }
  void _showResetMessage(BuildContext context,String title){
    var alert = AlertDialog(
      title: Text(title),
      content: Text("Press the reset button to start again"),
      actions: <Widget>[
        FlatButton(
          onPressed: _resetGame,
          color: Colors.white,
          child: Text("Reset"),
        ),
      ],
    );
    showDialog(context: context,builder: (context) =>alert);
  }
}

 