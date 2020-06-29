import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningflutter2020/bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:learningflutter2020/models/base_model.dart';

class MovieDetailScreen extends StatelessWidget {
  static const routeName = '/movies/detail';

  @override
  Widget build(BuildContext context) {
    final MovieModel movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Movie Detail'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context)),
        ),
        body: BlocProvider(
            create: (context) =>
                MovieBloc(httpClient: http.Client())..add(MovieFetched()),
            child: new Column(
              children: [
                new Stack(children: <Widget>[
                  Image.network(
                    'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                  ),
                  new Positioned(
                    left: 20.0,
                    top: 120.0,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ]),
                Text(movie.title),
                Text(movie.overview)
              ],
            )));
  }
}
