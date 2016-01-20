import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'dart:math' as math;

void main() {
  runApp(
    new MaterialApp(
      title: "Firechat",
      routes: <String, RouteBuilder>{
        '/': (RouteArguments args) => new FirechatApp()
      }
    )
  );
}

class FirechatApp extends StatefulComponent {
  @override
  State createState() => new FirechatAppState();
}

class FirechatAppState extends State {
  Firebase _firebase;
  List<Map<String, String>> _messages;
  String _user;

  void initState() {
    _firebase = new Firebase("https://firechat-ios.firebaseio-demo.com/");
    _user = "Guest${new math.Random().nextInt(1000)}";
    _firebase.onChildAdded.listen((Event event) {
      Map<String, String> message = event.snapshot.val();
      _messages.insert(0, message);
    });
    _messages = <Map<String, String>>[];
    super.initState();
  }

  void _addMessage(String text) {
    Map<String, String> message = {
      'name': _user,
      'text': text,
    };
    _firebase.push().set(message);
  }

  Widget _buildMessage(Map<String, String> message) {
    return new Center(
      child: new Text("${message['name']}: ${message['text']}")
    );
  }

  GlobalKey _messageKey = new GlobalKey();

  Widget build(BuildContext context) {
    return new Scaffold(
      toolBar: new ToolBar(
        center: new Text("Chatting as $_user")
      ),
      body: new Material(
        child: new Column(
          children: [
            new Container(
              margin: const EdgeDims.all(6.0),
              child: new Input(
                key: _messageKey,
                placeholder: 'Enter message',
                keyboardType: KeyboardType.TEXT,
                onSubmitted: _addMessage
              )
            ),
            new Flexible(
              child: new ScrollableList(
                itemExtent: 50.0,
                children: _messages.map(_buildMessage)
              )
            ),
          ]
        )
      )
    );
  }
}
