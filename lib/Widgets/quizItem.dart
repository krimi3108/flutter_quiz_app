import 'package:flutter/material.dart';

 import './question.dart';
 import './answer.dart';

class QuizItem extends StatelessWidget {
final List<Map<String, Object>> questions;
final int questionIndex;
final Function answerQuestion;

QuizItem({
  @required this. questions,
  @required this.questionIndex,
  @required this.answerQuestion
});

  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                Questions(questions[questionIndex]["question"]),

                // The 3 dots in below line is get every value which given by map.tolist() method
                // and put it into the column as individual child.
                ...(questions[questionIndex]["answer"] as List<Map<String, Object>>)
                    .map((answer) {
                  return Answer(() => answerQuestion(answer["score"]), answer["text"]);
                }).toList()
              ],
            );
  }
}