import 'package:flutter/material.dart';
import 'package:withyou/Shared/textstyle.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListWheelScrollView(
            itemExtent: 200,
            useMagnifier: false,
            diameterRatio: 4,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(top: 80),
                width: 1000,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlueAccent,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Self Improvent',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(top: 80),
                width: 1000,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlueAccent,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Time Management',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(top: 80),
                width: 1000,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlueAccent,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Communication',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap:()=> Navigator.pushNamed(context,'/game'),
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.only(top: 80),
                  width: 1000,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.lightBlueAccent,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Playing Games',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
