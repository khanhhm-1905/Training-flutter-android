import 'package:flutter/material.dart';
import 'package:learningflutter2020/views/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new ConstrainedBox(
          constraints: new BoxConstraints.expand(),
          child: new DecoratedBox(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.deepOrangeAccent, Colors.deepOrangeAccent, Colors.pinkAccent, Colors.pink]
              ),
            ),
            child: new LoginScreen()
          ),
        ),
      ),
    );
  }
}