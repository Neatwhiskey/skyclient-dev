import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AppController extends GetxController {
  // static Map<String, Setting> sett = {};

  static AppController? instance;
  static BoxConstraints viewConstraints = BoxConstraints();
  static String clientId = "";
  static String busName = "Sky Test";

  AppController() {
    log("Creating AppController");
    instance = this;
  }
}

class AppSetting {}
