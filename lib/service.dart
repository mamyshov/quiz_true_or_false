import 'dart:developer';

import 'package:quiz_true_or_false/question.dart';

class QuestionServices {
  int index = 0;
  List<Question> questions = [
    const Question(text: 'Kyrgyzstandyn borboru Bishkek', joop: true), // 0
    const Question(text: 'Duynodogu en biyik too Ala-Too', joop: false), // 1
    const Question(text: '2+2=5', joop: false), // 2
    const Question(text: '10+1 = 11', joop: true), // 3
    const Question(text: '1+1=3', joop: false), //4
    const Question(text: '1+1=2', joop: true),
  ];
  String bringQuestion() {
    return questions[index].text;
  }

  bool bringAnswer() {
    return questions[index].joop;
  }

  void nextQuestion() {
    print('1 nextquestion index = $index questions = ${questions.length}');
    if (index < questions.length - 1) {
      index++;
    }
    print('2 nextquestion index = $index questions = ${questions.length}');
  }

  bool finish() {
    return index == questions.length - 1;
  }

  void kayradanBashta() {
    index = 0;
  }
}
