import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "Flutter Demo",
      routes: <String, RouteBuilder>{
        '/': (RouteArguments args) => new FlutterDemo()
      }
    )
  );
}

class FlutterDemo extends StatefulComponent {
  @override
  State createState() => new FlutterDemoState();
}

class FlutterDemoState extends State {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      toolBar: new ToolBar(
        center: new Text("Flutter Demo")
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
