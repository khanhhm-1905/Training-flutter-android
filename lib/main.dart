import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new ConstrainedBox(
          constraints: new BoxConstraints.expand(),
          child: new DecoratedBox(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.deepOrangeAccent, Colors.deepOrangeAccent, Colors.pinkAccent, Colors.pink]
              ),
            ),
            child: Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container (
                        child: SizedBox(
                          height: 155.0,
                          child: Image.asset(
                            'assets/images/connexion.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container (
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('CONN',
                              style: Theme.of(context).textTheme.headline4.copyWith(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                            Text('EXION',
                              style: Theme.of(context).textTheme.headline4.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        )
                      ),
                      Container (
                        width: 200,
                        child: Padding (
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                          child: Text('Find and Meet people around you to find LOVE',
                            style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container (
                        width: 500,
                        height: 100,
                        child: Padding (
                          padding: const EdgeInsets.all(15.0),
                          child: FlatButton.icon(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                side: BorderSide(color: Colors.red),
                              ),
                              onPressed: () {},
                              color: Colors.white,
                              textColor: Colors.red,
                              icon: Image.asset(
                                'assets/images/ic_fb.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                              ),
                              label: Text(
                                'Sign in with Facebook',
                                style: Theme.of(context).textTheme.headline4.copyWith(
                                  color: Colors.pink,
                                  fontSize: 20,
                                ),
                              )
                          ),
                        ),
                      ),
                      Container (
                        width: 500,
                        height: 100,
                        child: Padding (
                          padding: const EdgeInsets.all(15.0),
                          child: FlatButton.icon(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                side: BorderSide(color: Colors.red),
                              ),
                              onPressed: () {},
                              color: Colors.white,
                              textColor: Colors.red,
                              icon: Image.asset(
                                'assets/images/ic_tw.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                              ),
                              label: Text(
                                'Sign in with Twitter',
                                style: Theme.of(context).textTheme.headline4.copyWith(
                                  color: Colors.pink,
                                  fontSize: 20,
                                ),
                              )
                          ),
                        ),
                      ),
                      Container (
                        width: 500,
                        height: 100,
                        child: Padding (
                          padding: const EdgeInsets.all(15.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                              side: BorderSide(color: Colors.red),
                            ),
                            onPressed: () {},
                            color: Colors.white,
                            textColor: Colors.red,
                            child: Text('Sign Up',
                                style: Theme.of(context).textTheme.headline4.copyWith(
                                  fontSize: 20,
                                  color: Colors.pink,
                                )
                            ),
                          ),
                        ),
                      ),
                      Container (
                        child: Padding (
                          padding: const EdgeInsets.all(15.0),
                          child: Text('ALREADY REGISTERED? SIGN IN',
                            style: Theme.of(context).textTheme.headline4.copyWith(
                                color: Colors.white,
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
