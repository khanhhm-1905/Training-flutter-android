import 'package:flutter/material.dart';
import 'package:learningflutter2020/models/movie_model.dart';

class MovieListScreen extends StatelessWidget {
  static const routeName = '/movies/list';

  @override
  Widget build(BuildContext context) {
    final MovieModel movie = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: new Center(
        child: new ConstrainedBox(
          constraints: new BoxConstraints.expand(),
          child: Text("message"),
        ),
      ),
    );
  }
}
