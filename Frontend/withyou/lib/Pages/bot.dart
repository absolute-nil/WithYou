import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ChatBot extends StatefulWidget {
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  List<String> _value = ['Chatbot is connected', 'Hey, how are you doing?'];
  String _val = '';
  
  final String _url = "https://codeshastra-ai-bot.herokuapp.com/";
  final TextEditingController _controller = new TextEditingController();
  var now=new DateTime.now();


  Future<String> postMessage() async {
    _value.add(_val);
    _controller.clear();
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"MSG": "${_val}"}';
    print(json);
    var response = await post(_url, headers: headers, body: json);
    setState(() {
      _value.add(response.body.toString());
    });
  }

  Future<String> getMessage() async {
    var response = await get(_url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: index.isEven
                      ? EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                          left: 80.0,
                        )
                      : EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                          right: 80,
                        ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    color: index.isEven
                        ? Colors.blueAccent[100]
                        : Colors.purple[50],
                    borderRadius: index.isEven
                        ? BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                          )
                        : BorderRadius.only(
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        now.toString().substring(11,16),
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 6.5),
                      Text(
                        _value[index],
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              },
              //     )
              //     return Container(
              //       margin: EdgeInsets.only(
              //   top: 8.0,
              //   bottom: 8.0,
              // ),
              //         color: Colors.blue, child: Text(_value[index]));
              //   },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 3,
                );
              },
              itemCount: _value.length,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    filled: false,
                    hintText: 'Send a message',
                    contentPadding: EdgeInsets.only(left:30),
                    border: InputBorder.none
                  ),
                  onChanged: (val) => setState(() {
                    _val = val;
                  }),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                iconSize: 34,
                color: Colors.green,
                onPressed: postMessage,
              )
            ],
          ),
        ],
      ),
    );
  }
}
