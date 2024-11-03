import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:skyclient/views/login/login_page.dart';
import 'package:skyclient/views/question/question_page.dart';
import 'package:skyclient/views/question/upload/upload_page.dart';
import 'package:skyclient/views/setup/temp_page.dart';

class AlmondApp extends ConsumerWidget {
  const AlmondApp({super.key});

  static final List<GetPage> pages = [
    GetPage(name: '/', page: () => const LoginPage()),
    GetPage(name: '/question', page: () => const QuestionPage()),
    GetPage(name: '/temp', page: () => const TempPage()),
    GetPage(name: '/question/upload', page: () => const UploadPage()),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isOnline =
    //     ref.watch(connectNotifier.select((cc) => cc.lastConnected == "online"));

    return GetMaterialApp(
      home: const QuestionPage(),
      getPages: pages,
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 106, 108, 110),
            brightness: Brightness.light),
        buttonTheme: const ButtonThemeData(
            buttonColor: Colors.lime, textTheme: ButtonTextTheme.primary),
        // textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
