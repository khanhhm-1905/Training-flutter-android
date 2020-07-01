import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:learningflutter2020/bloc/bloc.dart';
import 'package:learningflutter2020/models/base_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MovieDetailScreen extends StatelessWidget {
  static const routeName = '/movies/detail';

  @override
  Widget build(BuildContext context) {
    final MovieModel movie = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('Movie detail', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black)),
          backgroundColor: CupertinoColors.white,
        ),
        body: BlocProvider(
            create: (context) =>
                MovieBloc(httpClient: http.Client())..add(MovieFetched()),
            child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        FittedBox(
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500/${movie.backdropPath}",
                          ),
                          fit: BoxFit.fill,
                        ),
                        Positioned.fill(
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(
                                    20, 50.0, 0, 10.0),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                                  fit: BoxFit.fitHeight,
                                ),
                              )),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Container(
                        color: Colors.white,
                        margin:
                            const EdgeInsets.only(left: 20, top: 10, right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              flex: 5,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                width: double.maxFinite,
                                child: Text(
                                  movie.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,),
                                  softWrap: true,
                                ),
                              )
                            ),

                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: double.maxFinite,
                                child: new CircularPercentIndicator(
                                  radius: 30.0,
                                  lineWidth: 4.0,
                                  percent: movie.voteAverage / 10,
                                  center: new Text("${movie.voteAverage}", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                                  progressColor: Colors.black87,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Divider(color: Colors.black26),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      height: 65,
                      child: Row(
                        children: <Widget>[
                          new Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/reviews.png',
                                    height: 35,
                                    width: 35,
                                  ),
                                  Text(
                                    "Reviews",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(color: Colors.black26),
                          new Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/play.png',
                                    height: 35,
                                    width: 35,
                                  ),
                                  Text(
                                    "Trailers",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.black26),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      height: 65,
                      child: Row(
                        children: <Widget>[
                          new Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Genre",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "genres",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          new Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Release",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    movie.releaseDate,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.black26),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        movie.overview,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    )
                  ],
                ))));
  }
}
