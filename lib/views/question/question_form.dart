import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyclient/main.dart';
import 'package:skyclient/views/question/question_controller.dart';

class QuestionForm extends GetView<QuestionController> {
  const QuestionForm({super.key});

  @override
  Widget build(BuildContext context) {
    fToast.init(context);

    return SizedBox(
      width: 400,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [Text("Question")])),
    );
  }
}
