import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skyclient/global/nav/nav_controller.dart';
import 'package:skyclient/global/nav/nav_menu.dart';

class SideNav extends GetView<NavController> {
  SideNav({super.key});

  @override
  Widget build(BuildContext context) {
    final String navPage = controller.navPage;
    return Visibility(
      visible: true,
      child: SizedBox(
        height: double.infinity,
        child: Container(
          width: 150,
          decoration: const BoxDecoration(
            border: Border(
                right: BorderSide(
                    color: Color.fromARGB(255, 184, 181, 181), width: 1)),
          ),
          // padding: Padding(padding: EdgeInsetsGeometry(EdgeInsets.all(10))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Visibility(
                    //     visible: AppController.connectedOnline,
                    //     child: NavMenu(
                    //       label: "Home",
                    //     )),
                    // Visibility(
                    //     visible: true,
                    //     child: SubMenu(
                    //       label: "Home",
                    //       route: "/",
                    //     )),
                    // Visibility(
                    //   visible: true,
                    //   child: SubMenu(
                    //     label: "Manage",
                    //     route: "/sale",
                    //   ),
                    // ),
                    Visibility(
                      visible: navPage.startsWith("/question"),
                      child: SubMenu(
                        label: "Upload",
                        route: "/question/upload",
                      ),
                    ),
                    Visibility(
                      visible: navPage.startsWith("/question"),
                      child: SubMenu(
                        label: "All",
                        route: "/question/all",
                      ),
                    ),
                  ],
                ),
                Column(children: [
                  // NavMenu(
                  //   label: "Settings",
                  //   route: "/settings",
                  //   icon: Icons.settings,
                  // ),
                  const SizedBox(
                      height: 40,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Expanded(
                            //     flex: 2,
                            //     child: InkWell(
                            //       child: Container(
                            //         color: offlineCounter == 0
                            //             ? Colors.grey
                            //             : onBkgColor,
                            //         child: Text(
                            //           "CONNECTED",
                            //         ),
                            //         alignment: Alignment.center,
                            //       ),
                            //       onTap: () {
                            //         OfflineController offlineController =
                            //             ref.read(offlineNotifier);
                            //         offlineController.setOfflineMode(false);
                            //       },
                            //     )),
                            // InkWell(
                            //   child: Container(
                            //     color: offlineCounter == 4
                            //         ? Colors.grey
                            //         : offBkgColor,
                            //     child: Padding(
                            //       padding: EdgeInsets.only(left: 3, right: 3),
                            //       child: Text(
                            //         "OFFLINE",
                            //       ),
                            //     ),
                            //     alignment: Alignment.center,
                            //   ),
                            //   onTap: () {
                            //     OfflineController offlineController =
                            //         ref.read(offlineNotifier);
                            //     offlineController.setOfflineMode(true);
                            //   },
                            // ),
                          ])),
                ]),
              ]),
        ),
      ),
    );
  }
}
