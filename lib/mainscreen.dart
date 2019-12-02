
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_app/main.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: TextDirection.ltr,
        child: Background());
  }
}

class Background extends StatefulWidget {

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  Color _colorBackground = Color((1000000 - math.Random().nextInt(1000000)) * 0xFFFFFF);
  Color _colorText = Color((1000000 + math.Random().nextInt(1000000)) * 0xFFFFFF);
  String _email = 'Your email : ' + MyApp().getEmail;
  String _password = 'Your password : ' + MyApp().getPassword;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          setState(() {
            _colorBackground = Color((1000000 - math.Random().nextInt(1000000)) * 0xFFFFFF);
            _colorText = Color((1000000 + math.Random().nextInt(1000000)) * 0xFFFFFF);
          });
        },
        child: new Container(
            color: _colorBackground,
            child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                        child: new _MainText('Hey there!', _colorText)
                    ),
                    new Container(
                      child: new _MainText(_email, Colors.black),
//                      padding: new EdgeInsets.only(top: 10.0),
                    ),
                    new Container(
                      child: new _MainText(_password, Colors.black),
//                      padding: new EdgeInsets.only(top: 25.0),
                    )
                  ],
                )
            )
        )
    );
  }
}

class _MainText extends StatelessWidget {

  final String _label;
  final Color _color;

  _MainText(this._label, this._color);

  @override
  Widget build(BuildContext context) {
    return new Text(
      _label,
      style: new TextStyle(
        color: _color,
        fontSize: 20.0,
      ),
    );
  }
}