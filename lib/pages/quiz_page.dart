import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Some insects in China have acid blood that can burn metal", false),
    new Question("Female kangaroos have three vaginas", true),
    new Question("Some turtles can breathe through their butts", true),
    new Question("You cannot die from drinking too much water", false),
    new Question("Some turtles can breathe through their butts", true),
    new Question("A Mexican tribe believes Coca Cola is a healing drug", true),
    new Question("A chicken once lived for 18 months without a head", true),
    new Question("Chewing gum takes years to digest.", false),
    new Question("NASA designed a space pen instead of using a pencil", false),
    new Question("Bats are blind", false),


  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // This is the main page
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)), // True button
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)), // False button
          ],
        ),
        overlayShouldBeVisible == true ? new CorrectWrongOverlay(
            isCorrect,
                () {
              if (quiz.length == questionNumber) {
                Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
                return;
              }
              currentQuestion = quiz.nextQuestion;
              this.setState(() {
                overlayShouldBeVisible = false;
                questionText = currentQuestion.question;
                questionNumber = quiz.questionNumber;
              });
            }
        ) : new Container()
      ],
    );
  }
}