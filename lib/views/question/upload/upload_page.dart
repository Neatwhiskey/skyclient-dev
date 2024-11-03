import 'package:flutter/material.dart';
import 'package:skyclient/global/controllers/app_controller.dart';
import 'package:skyclient/global/nav/side_nav.dart';
import 'package:skyclient/global/nav/top_nav.dart';
import 'package:skyclient/global/widgets/app_bar.dart';
import 'package:skyclient/views/question/upload/upload_form.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
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
            children: [SideNav(), const Expanded(flex: 5, child: UploadForm())],
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
