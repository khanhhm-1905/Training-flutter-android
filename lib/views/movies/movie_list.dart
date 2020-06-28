import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningflutter2020/bloc/bloc.dart';
import 'package:learningflutter2020/main.dart';
import 'package:learningflutter2020/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieListScreen extends StatelessWidget {
  static const routeName = '/movies/list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: BlocProvider(
        create: (context) =>
            MovieBloc(httpClient: http.Client())..add(MovieFetched()),
        child: MovieList(),
      ),
    );
  }
}

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MovieBloc _movieBloc;

  @override
  void initState() {
    super.initState();
    _movieBloc = BlocProvider.of<MovieBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieFailure) {
          return Center(
            child: Text('failed to fetch movies'),
          );
        }
        if (state is MovieSuccess) {
          if (state.movies.isEmpty) {
            return Center(
              child: Text('no movies'),
            );
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return MovieWidget(movie: state.movies[index]);
            },
            itemCount: state.movies.length,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class MovieWidget extends StatelessWidget {
  final MovieModel movie;

  const MovieWidget({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.network(
            'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
            fit: BoxFit.cover),
        title: Text(movie.title),
        subtitle: Text(
          movie.overview,
          maxLines: 5,
        ),
        dense: true,
        onTap: () {
          BlocProvider.of<MyBloc>(context).add(MyEvent.movieDetailEvent);
        });
  }
}
