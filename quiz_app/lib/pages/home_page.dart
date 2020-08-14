import 'package:flutter/material.dart';
import 'package:quiz_app/model/Question.dart';
import 'package:quiz_app/widgets/answer.dart';
import 'package:quiz_app/widgets/progress_bar.dart';
import 'package:quiz_app/widgets/quiz.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final QuestionData data = QuestionData();
  int _countResult = 0;
  int _questionIndex = 0;

  List<Icon> _icons = [];

  void _clearState() => setState(() {
        _questionIndex = 0;
        _countResult = 0;
        _icons = [];
      });

  void _onChangeAnswer(bool isCorrect) => setState(() {
        if (isCorrect) {
          _icons.add(Icon(
            Icons.brightness_1,
            color: Color(0xffbd27ff),
          ));
          _countResult++;
        } else {
          _icons.add(Icon(
            Icons.brightness_1,
            color: Color(0xff000000),
          ));
        }
        _questionIndex++;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Тестирование'),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              color: const Color(0xff2a375a),
          ),
          child: Column(
            children: [
              ProgressBar(
                icons: _icons,
                count: _questionIndex,
                total: data.questions.length,
              ),
              Quiz(
                index: _questionIndex,
                questionData: data,
                onChangeAnswer: _onChangeAnswer,
              ),
            ],
          ),
        ));
  }
}
