import 'package:flutter/material.dart';
import './landing_page.dart';

class ScorePage extends StatelessWidget {

  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.deepOrangeAccent,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("You answered", style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40.0),),
            new Text(score.toString() + " out of " + totalQuestions.toString(), style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40.0)),
            new Text("facts right", style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40.0),),
            new IconButton(
                icon: new Icon(Icons.refresh),
                color: Colors.black,
                iconSize: 150.0,
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), (Route route) => route == null)
            ),
          ],
        )
    );
  }
}