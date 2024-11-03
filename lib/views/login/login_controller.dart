import 'dart:developer';

import 'package:get/get.dart';

class LoginController extends GetxController {
  bool readyForActivation = false;
  static String sessionId = "";
  String userId = "";
  String? lastUserId;
  String lastPage = "/";
  String? userName;
  String? username;
  String? password;
  String clientId = "";
  String regCode = "";
  bool loggedIn = false;
  bool isOnline = false;
  bool busNotFound = false;
  List<String> userRoles = [];
  List<String> userRights = ["modify_price"];
  static late final LoginController instance;
  DateTime timeDeployed = DateTime(2024, 6, 1);
  String navPage = "";
  double stockBalanceProgress = 0;
  static bool isOwner = false;
  static bool isAdmin = false;

  LoginController() {
    log("Creating LoginController");
    instance = this;
    startUp();
  }

  void startUp() async {
    // log("data_retention_days : ${AppController.retentionDays}");
  }

  void updateStockBalanceProgress(double done) {
    stockBalanceProgress = done;
    update();
  }

  void changePage(lbl) {
    navPage = lbl;
    update();
  }

  void setLoading(bool update) {
    // apiReqLoading = update;
    // update();
  }

  bool hasRight(String right) {
    if (userRoles.contains('OWNER')) return true;
    return userRights.contains(right);
  }

  bool hasRole(String role) {
    if (userRoles.contains('OWNER')) return true;
    return userRoles.contains(role);
  }

  void changeBusNotFound() {
    busNotFound = true;
    update();
  }

  // Future<Result> logoutOnline(String? mobInstanceId) async {
  //   return await connectApi.logoutOnline({"mobInstanceId": mobInstanceId});
  // }
}
