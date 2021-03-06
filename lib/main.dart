import 'package:flutter/material.dart';

import './LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Portfolio Project",
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text("Welcome"),
          backgroundColor: Colors.blueGrey,
        ),
        body: SafeArea(
            child: LoginScreen()
        ),

      ),
    );
  }

}

