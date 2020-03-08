import 'package:flutter/material.dart';
import 'package:withyou/Pages/bot.dart';
import 'package:withyou/Pages/feeds.dart';
import 'package:withyou/Pages/groupchat.dart';
import 'package:withyou/Pages/tictac.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
// e6f6d87dad5019393fcbbfbeb639976029b65068

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  List<Widget> _widgetOption=<Widget>[
  FeedPage(),
  GroupPage(),
  TicTacToe(),
  ChatBot(),
  Text(''),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.blue[300]
      ),     
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              arrowColor: Colors.red,
              accountName: Text('Darshan Satra'),
              accountEmail: Text('darshan@my.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue[900],
                child: Text(
                  'D',
                  style: TextStyle(fontSize: 40,color: Colors.white),
                ),
              ),
            ),
            ListTile(
              title: Text('LogOut'),
              onTap: (){
                Navigator.of(context).pushNamed('/login');
              },
            ),
            ListTile(
              title: Text('Close'),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            title: Text('Games'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text('Chatbot'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            title: Text('Profile')
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.blue,
      )
    );
  }
}