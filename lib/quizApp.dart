import "package:flutter/material.dart";
import './Widgets/quizItem.dart';
import './Widgets/result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  var _questionIndex = 0;
  var _totalScroe = 0;

  var _questions = [
    {
      "question": "What\'s your favriote color?",
      "answer": [
        {"text": "Black", "score": 10},
        {"text": "Green", "score": 6},
        {"text": "Blue", "score": 3},
        {"text": "Purple", "score": 1},
      ],
    },
    {
      "question": "Who is your best buddy?",
      "answer": [
        {"text": "Michle", "score": 6},
        {"text": "Jack", "score": 10},
        {"text": "Tom", "score": 3},
        {"text": "Steve", "score": 1},
      ]
    },
    {
      "question": "What\'s your favriote sports?",
      "answer": [
        {"text": "Cricket", "score": 1},
        {"text": "Sketcing", "score": 6},
        {"text": "Kho-kho", "score": 3},
        {"text": "Badminton", "score": 10},
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScroe += score;

    setState(() {
      _questionIndex += 1;
    });
    print("Answer chosen...");
  }

  void _resetQuiz() {
    setState(() {
      _totalScroe = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: _questionIndex < _questions.length
          ? QuizItem(
              questions: _questions,
              questionIndex: _questionIndex,
              answerQuestion: _answerQuestion)
          : Result(_totalScroe, _resetQuiz),
    ));
  }
}
