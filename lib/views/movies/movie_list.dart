import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningflutter2020/bloc/bloc.dart';
import 'package:learningflutter2020/main.dart';
import 'package:learningflutter2020/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:learningflutter2020/views/movies/movie_detail.dart';

class MovieListScreen extends StatelessWidget {
  static const routeName = '/movies/list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular'),
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
        if (state is MovieSuccess) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return MovieWidget(movie: state.movies[index]);
            },
            itemCount: state.movies.length,
          );
        }
        return Center(
          child: Text('failed to fetch movies'),
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
    print(movie);
    return ListTile(
        leading: SizedBox(
          height: 100,
          width: 70,
          child: Image.network(
              'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
              fit: BoxFit.cover),
        ),
        title: Text(
            movie.title,
          style: TextStyle(
            fontSize: 15
          )
        ),
        subtitle: Text(
          movie.overview,
          maxLines: 3,
        ),
        dense: true,
        onTap: () {
          Navigator.of(context)
              .pushNamed(MovieDetailScreen.routeName, arguments: movie);
        });
  }
}
