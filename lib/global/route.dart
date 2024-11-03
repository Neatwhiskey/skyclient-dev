import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skyclient/views/login/login_page.dart';
import 'package:skyclient/views/question/question_page.dart';
import 'package:skyclient/views/question/upload/upload_page.dart';
import 'package:skyclient/views/setup/temp_page.dart';

void route(context, page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

void routeReplace(context, page) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => page));
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/question',
      builder: (context, state) => QuestionPage(),
    ),
    GoRoute(
      path: '/question/upload',
      builder: (context, state) => UploadPage(),
    ),
    GoRoute(
      path: '/temp',
      builder: (context, state) => TempPage(),
    ),
    // GoRoute(
    //   path: '/Purchase',
    //   builder: (context, state) => PurchasePage(),
    // ),
    // GoRoute(
    //   path: '/Sale/AllSales',
    //   builder: (context, state) => AllSalePage(),
    // ),
    // GoRoute(
    //   path: '/Purchase/AllPurchases',
    //   builder: (context, state) => AllPurchasePage(),
    // ),
    // GoRoute(
    //   path: '/Payment/AllPayments',
    //   builder: (context, state) => AllPaymentPage(),
    // ),
    // GoRoute(
    //   path: '/Setting/index',
    //   builder: (context, state) => SettingPage(),
    // ),
    // // GoRoute(
    // //   path: '/Online/Sale/AllSale',
    // //   builder: (context, state) => OnlineAllSalePage(),
    // // ),
    // GoRoute(
    //   path: '/Stock/AllItem',
    //   builder: (context, state) => ItemPage(),
    // ),
  ],
);
