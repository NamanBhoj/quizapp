import 'package:flutter/material.dart';
import 'Question.dart';
import 'Quizbrain.dart';

Quizbrain quizbrain = Quizbrain();

void main() => runApp(QApp());

class QApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Qpage(),
        ),
      ),
    );
  }
}

class Qpage extends StatefulWidget {
  @override
  _QpageState createState() => _QpageState();
}

class _QpageState extends State<Qpage> {
  List<Widget> answercheck = [];

  void checkanswer(bool userpickedanswer) {
    bool Correctanswer = quizbrain.Getquestionanswer();
    setState(() {
      if (Correctanswer == userpickedanswer) {
        answercheck.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        answercheck.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      quizbrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Center(child: Text(quizbrain.Getquestiontext())),
        ), //POST YOUR QUESTION
        Expanded(
            child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(64.0),
              child: FlatButton(
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                textColor: Colors.green,
                color: Colors.green,
                onPressed: () {
                  checkanswer(true);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: FlatButton(
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                textColor: Colors.green,
                color: Colors.red,
                onPressed: () {
                  checkanswer(false);
                },
              ),
            ),
          ],
        )), //TRUE FALSE

        //TODO :  ADD A ROW AS SCOREKEEPER
        Row(children: answercheck)
      ],
    );
  }
}
