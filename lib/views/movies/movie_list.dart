import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:learningflutter2020/bloc/bloc.dart';
import 'package:learningflutter2020/models/movie_model.dart';
import 'package:learningflutter2020/views/movies/movie_detail.dart';

class MovieListScreen extends StatelessWidget {
  static const routeName = '/movies/list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Popular', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black)),
        backgroundColor: CupertinoColors.white,
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
          child: Text('loading'),
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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(MovieDetailScreen.routeName, arguments: movie);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 100,
                    minHeight: 150,
                    maxWidth: 100,
                    maxHeight: 150,
                  ),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        movie.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Flexible(
                        child: Text(
                          movie.overview,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
