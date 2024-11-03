import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skyclient/global/controllers/app_controller.dart';
import 'package:skyclient/global/nav/side_nav.dart';
import 'package:skyclient/global/nav/top_nav.dart';
import 'package:skyclient/views/setup/temp_controller.dart';
import 'package:skyclient/views/setup/temp_form.dart';

class TempPage extends StatefulWidget {
  const TempPage({super.key});

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  var image =
  const Image(image: AssetImage('images/sky_blue.jpg'), fit: BoxFit.cover);

  @override
  void initState() {
    super.initState();
    // Initialize TempController when TempPage is created
    Get.put(TempController());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext buildContext, BoxConstraints constraints) {
          AppController.viewConstraints = constraints;
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Container(
                    child: const Text(
                      "Sky Test",
                      style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 3,
                        // fontFamily: GoogleFonts.alata().fontFamily,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: TopNav(),
                    ),
                  )
                ],
              ),
              centerTitle: true,
              toolbarHeight: 50,
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SideNav(),
                  Expanded(
                    flex: 1,
                    child: TempForm(), // Uses TempController implicitly
                  )
                ],
              ),
            ),
            bottomNavigationBar: Container(
              color: Colors.blue,
              height: 30,
              child: const Center(
                child: Text(
                  " (c) Sky Client 2024",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        });
  }
}
