import 'package:flutter/material.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {

  final index;
  final questionData;
  final onChangeAnswer;


  Quiz({this.index, this.questionData, this.onChangeAnswer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            questionData.questions[index].title,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        ...questionData.questions[index].answers
            .map((value) => Answer(
          title: value['answer'],
          onChangeAnswer: onChangeAnswer,
          isCorrect: value.containsKey('isCorrect') ? true : false,
        ))
            .toList(),
      ],
    );
  }
}
