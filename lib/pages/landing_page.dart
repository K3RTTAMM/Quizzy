import 'package:flutter/material.dart';
import './quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.lightGreen,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Quizzy", style: new TextStyle(color: Colors.white, fontSize: 100.0, fontWeight: FontWeight.bold),),
            new Text("Tap to start!", style: new TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),)
          ],
        ),
      ),
    );
  }
}