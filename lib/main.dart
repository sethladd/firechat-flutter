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
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      toolBar: new ToolBar(
        center: new Text("Firechat")
      ),
      body: new Material(
        child: new Center(
          child: new Text("Button tapped $counter times.")
        )
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(
          icon: 'content/add'
        ),
        onPressed: incrementCounter
      )
    );
  }
}
