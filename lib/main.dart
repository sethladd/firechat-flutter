import 'package:flutter/material.dart';

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
  List<String> _messages;

  void initState() {
    _messages = <String>[];
    super.initState();
  }

  void _addMessage(String message) {
    setState(() => _messages.insert(0, message));
  }

  Widget _buildMessage(String message) {
    return new Center(
      child: new Text(message)
    );
  }

  GlobalKey _messageKey = new GlobalKey();

  Widget build(BuildContext context) {
    return new Scaffold(
      toolBar: new ToolBar(
        center: new Text("Firechat")
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
