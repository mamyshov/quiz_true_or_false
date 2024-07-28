import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_true_or_false/service.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  QuestionServices servis = QuestionServices();

  List<Widget> iconkalar = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Text(
                servis.bringQuestion(),
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  creatButton(
                    text: 'TRUE',
                    style: Theme.of(context).elevatedButtonTheme.style!,
                    onPressed: () {
                      checkAnswer(true);
                    },
                  ),
                  SizedBox(height: 24),
                  creatButton(
                      text: 'FALSE',
                      style:
                          Theme.of(context).elevatedButtonTheme.style!.copyWith(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Colors.red,
                                ),
                                foregroundColor: WidgetStateProperty.all<Color>(
                                  Colors.white,
                                ),
                              ),
                      onPressed: () {
                        checkAnswer(false);
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Row(
                      children: iconkalar,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget creatButton({
    required String text,
    required ButtonStyle style,
    required VoidCallback onPressed,
  }) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 18.0,
                ),
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.black),
                )),
          ),
        ),
      ],
    );
  }

  void checkAnswer(bool usersAnswer) {
    bool finish = servis.finish();
    bool trueAnswer = servis.bringAnswer();

    if (finish == true) {
      print('buttu-----------');
      iconkaKosh(trueAnswer == usersAnswer);
      kayradanBashta();
    }
    if (finish == false) {
      print("butto elek ========");
      if (trueAnswer == usersAnswer) {
        iconkaKosh(true);
      } else {
        iconkaKosh(false);
      }
    }
  }

  void iconkaKosh(bool addTrue) {
    if (addTrue == true) {
      iconkalar.add(Icon(Icons.check, color: Colors.white));
    } else {
      iconkalar.add(Icon(Icons.close, color: Colors.red));
    }

    setState(() {
      servis.nextQuestion();
    });
  }

  void kayradanBashta() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('Suroolor buttu'),
            content: const SingleChildScrollView(
              child: Text('Kayradan bashta'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  servis.kayradanBashta();
                  // ikonkalar = [];
                  iconkalar.clear();
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
