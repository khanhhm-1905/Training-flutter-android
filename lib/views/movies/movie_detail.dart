import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningflutter2020/bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:learningflutter2020/main.dart';

class MovieDetailScreen extends StatelessWidget {
  static const routeName = '/movies/detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Detail'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              BlocProvider.of<MyBloc>(context).add(MyEvent.movieListEvent),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            MovieBloc(httpClient: http.Client())..add(MovieFetched()),
        child: MovieDetail(),
      ),
    );
  }
}

class MovieDetail extends StatefulWidget {
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
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
        return Text('Tiep');
      },
    );
  }
}
