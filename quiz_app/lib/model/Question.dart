import 'package:flutter/foundation.dart';

class Question {
  final String title;
  final List<Map> answers;

  Question({@required this.title, @required this.answers});
}

class QuestionData {
  final _data = [
    Question(
        title:
            'Кто из президентов США написал свой собственный рассказ про Шерлока Холмса?',
        answers: [
          {
            'answer': 'Джон Кеннеди',
          },
          {
            'answer': 'Франклин Рузвельт', 'isCorrect': 1
          },
          {
            'answer': 'Рональд Рейган',
          },
        ]),
    Question(
        title:
            'Какую пошлину ввели в XII  веке в Англии для того чтобы заставить мужчин пойти на войну?',
        answers: [
          {
            'answer': 'Налог на тунеядство',
          },
          {
            'answer': 'Налог на трусость', 'isCorrect': 1
          },
          {
            'answer': 'Налог на отсутствие сапог',
          }
        ]),
    Question(title: 'Откуда пошло выражение «деньги не пахнут?', answers: [
      {
        'answer': 'От подателей за провоз парфюмерии',
      },
      {
        'answer': 'От сборов за нестиранные носки',
      },
      {
        'answer': 'От налога на туалеты', 'isCorrect': 1
      }
    ]),
    Question(
        title: 'Туристы, приезжающие на Майорку, обязаны заплатить налог…',
        answers: [
          {
            'answer': 'На плавки',
          },
          {
            'answer': 'На пальмы',
          },
          {
            'answer': 'На солнце', 'isCorrect': 1
          }
        ]),
  ];

  List<Question> get questions => [..._data];
}
