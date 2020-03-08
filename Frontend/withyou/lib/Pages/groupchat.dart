import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:withyou/Widgets/ChatPage/recent_chat.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20,),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: 'Search chats..'
          ),
        ),
        RecentPerson(),
      ],
    );
  }
}
