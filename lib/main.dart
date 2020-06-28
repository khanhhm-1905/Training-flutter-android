import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:learningflutter2020/views/movies/movie_list.dart';
import 'package:learningflutter2020/views/movies/movie_detail.dart';

void main() {
  runApp(
    BlocProvider<MyBloc>(
      create: (context) => MyBloc(),
      child: MyApp(),
    ),
  );
}

enum MyEvent { movieListEvent, movieDetailEvent }

@immutable
abstract class MyState {}

class MovieListState extends MyState {}

class MovieDetailState extends MyState {}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: BlocBuilder<MyBloc, MyState>(
        builder: (_, state) =>
            state is MovieListState ? MovieListScreen() : MovieDetailScreen(),
      ),
    );
  }
}

class MyBloc extends Bloc<MyEvent, MyState> {
  @override
  MyState get initialState => MovieListState();

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    switch (event) {
      case MyEvent.movieListEvent:
        yield MovieListState();
        break;
      case MyEvent.movieDetailEvent:
        yield MovieDetailState();
        break;
    }
  }
}
