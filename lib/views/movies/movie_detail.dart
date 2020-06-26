import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  static const routeName = '/movies/detail';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new ConstrainedBox(
          constraints: new BoxConstraints.expand(),
        ),
      ),
    );
  }
}
