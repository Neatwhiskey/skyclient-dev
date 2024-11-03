import 'package:get/get.dart';

class NavController extends GetxController {
  String navPage = "/";
  String menu = "/";
  bool saleMenu = false;
  bool purchaseMenu = false;
  bool paymentMenu = false;
  bool setupMenu = false;
  bool dashboardMenu = false;
  // bool reportsMenu = true;
  // bool settingsMenu = true;
  // bool helpMenu = true;

  void changePage(String page) {
    navPage = page;
    update();
  }

  void changeMenu(String men, String route) {
    menu = men;
    navPage = route;
    saleMenu = false;
    purchaseMenu = false;
    paymentMenu = false;
    setupMenu = false;
    dashboardMenu = false;
    update();
  }

  void toggleMenu(String label, bool value) {
    saleMenu = false;
    purchaseMenu = false;
    setupMenu = false;
    dashboardMenu = false;
    paymentMenu = false;
    switch (label) {
      case "Setup":
        if (!navPage.startsWith("/setup")) setupMenu = value;
      case "Sale":
        if (!navPage.startsWith("/sale")) saleMenu = value;
      case "Purchase":
        if (!navPage.startsWith("/purchase")) purchaseMenu = value;
      case "Payment":
        if (!navPage.startsWith("/payment")) paymentMenu = value;
    }
    update();
  }

  void toggleSubMenu(String route, bool value) {
    saleMenu = false;
    purchaseMenu = false;
    paymentMenu = false;
    setupMenu = false;
    dashboardMenu = false;

    if (route.startsWith("/setup")) {
      setupMenu = value;
      update();
      return;
    }

    if (route.startsWith("/sale")) {
      saleMenu = value;
      update();
      return;
    }

    if (route.startsWith("/purchase")) {
      purchaseMenu = value;
      update();
      return;
    }

    if (route.startsWith("/payment")) {
      paymentMenu = value;
      update();
      return;
    }

    update();
  }
}
