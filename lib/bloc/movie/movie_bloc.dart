import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:learningflutter2020/models/base_model.dart';
import 'package:learningflutter2020/bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final http.Client httpClient;

  MovieBloc({@required this.httpClient});

  @override
  get initialState => MovieInitial();

  @override
  Stream<Transition<MovieEvent, MovieState>> transformEvents(
    Stream<MovieEvent> events,
    TransitionFunction<MovieEvent, MovieState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    final currentState = state;
    if (event is MovieFetched) {
      try {
        if (currentState is MovieInitial) {
          final movies = await _fetchMovies(0, 20);
          yield MovieSuccess(movies: movies);
          return;
        }
        if (currentState is MovieSuccess) {
          final movies = await _fetchMovies(currentState.movies.length, 20);
          yield MovieSuccess(
            movies: currentState.movies + movies,
          );
        }
      } catch (_) {
        yield MovieFailure();
      }
    }
  }

  Future<List<MovieModel>> _fetchMovies(int startIndex, int limit) async {
    final response = await httpClient.get('https://api.themoviedb.org/3/movie/popular?api_key=d61431a2fb64b6e56c6f086952e63ab6');

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'] as List;

      return data.map((rawMovie) {
        return MovieModel(
          id: rawMovie['id'],
          title: rawMovie['title'],
          overview: rawMovie['overview'],
        );
      }).toList();
    } else {
      throw Exception('error fetching movies');
    }
  }
}
