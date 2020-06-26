import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
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
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                            style: TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontSize: 40
                            ),
                          ),
                          Text('EXION',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 40
                            ),
                          ),
                        ],
                      )
                  ),
                  Container (
                    width: 230,
                    child: Padding (
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                      child: Text('Find and Meet people around you to find LOVE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
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
                      child: RaisedButton (
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                          side: BorderSide(color: Colors.red),
                        ),
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.red,
                        child: Container (
                          child: Row (
                            children: <Widget>[
                              Image.asset(
                                'assets/images/ic_fb.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                              ),
                              VerticalDivider (
                                color: Colors.pink,
                                thickness: 1.5,
                                indent: 18,
                                endIndent: 18,
                              ),
                              GradientText('Sign in with Facebook',
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[Colors.deepOrangeAccent, Colors.deepOrangeAccent, Colors.pinkAccent, Colors.pink]
                                ),
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container (
                    width: 500,
                    height: 100,
                    child: Padding (
                      padding: const EdgeInsets.all(15.0),
                      child: RaisedButton (
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                          side: BorderSide(color: Colors.red),
                        ),
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.red,
                        child: Container (
                          child: Row (
                            children: [
                              Image.asset(
                                'assets/images/ic_tw.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                              ),
                              VerticalDivider (
                                color: Colors.pink,
                                thickness: 1.5,
                                indent: 18,
                                endIndent: 18,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: GradientText('Sign in with Twitter',
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: <Color>[Colors.deepOrangeAccent, Colors.deepOrangeAccent, Colors.pinkAccent, Colors.pink]
                                  ),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
                        child: GradientText('Sign Up',
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[Colors.deepOrangeAccent, Colors.deepOrangeAccent, Colors.pinkAccent, Colors.pink]
                            ),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.pink,
                                fontWeight: FontWeight.w400
                            )
                        ),
                      ),
                    ),
                  ),
                  Container (
                    child: Padding (
                      padding: const EdgeInsets.all(15.0),
                      child: Text('ALREADY REGISTERED? SIGN IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
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
    );
  }
}