import 'package:flutter/material.dart';
import 'package:skyclient/global/controllers/app_controller.dart';
import 'package:skyclient/global/nav/side_nav.dart';
import 'package:skyclient/global/nav/top_nav.dart';
import 'package:skyclient/global/widgets/app_bar.dart';
import 'package:skyclient/views/question/question_form.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext builContext, BoxConstraints constraints) {
      AppController.viewConstraints = constraints;
      return Scaffold(
        appBar: AppBar(
          title: AlmondAppBar(),
          centerTitle: true,
          toolbarHeight: 40,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SideNav(),
              const Expanded(
                flex: 5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Center(child: QuestionForm())]),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
            color: Colors.blue,
            height: 30,
            child: Center(
                child: Text(
              " (c) Sky Client 2024",
              style: TextStyle(color: Colors.white),
            ))),
      );
    });
  }
}
