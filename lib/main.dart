import 'package:flutter/material.dart';
import 'package:learningflutter2020/views/auth/login.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningflutter2020/views/movies/movie_list.dart';
import 'package:learningflutter2020/views/movies/movie_detail.dart';

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
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        MovieDetailScreen.routeName: (context) => MovieDetailScreen(),
        MovieListScreen.routeName: (context) => MovieListScreen(),
      },
    );
  }
}
