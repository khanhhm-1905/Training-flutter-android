import 'package:flutter/material.dart';
import 'package:learningflutter2020/views/auth/login.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningflutter2020/views/movies/index.dart';
import 'package:learningflutter2020/views/movies/show.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => MovieListScreen(),
        // When navigating to the "/" route, build the FirstScreen widget.
        '/movies': (context) => MovieListScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/movies/detail': (context) => MovieDetailScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
