import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:go_router/go_router.dart';
import 'package:skyclient/global/nav/nav_controller.dart';
import 'package:skyclient/global/styles.dart';

class TopMenu extends GetView<NavController> {
  String label;
  String route;
  bool highlight = false;
  IconData? icon;

  TopMenu({
    super.key,
    required this.label,
    required this.route,
    this.highlight = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    highlight = controller.navPage.startsWith(route);

    return Container(
      child: InkWell(
        onTap: () {
          log("Tapped : ${label}");
          controller.changeMenu(label, route);
          Get.toNamed(route);
        },
        // onHover: (value) {
        //   if (value) navController.toggleMenu(label, value);
        // },
        child: Builder(builder: (BuildContext context) {
          if (highlight) {
            SchedulerBinding.instance
                .addPostFrameCallback((Duration timeStamp) {
              Scrollable.ensureVisible(context, alignment: 0.5);
              // log("Selection : ${(options.elementAt(index) as Item).name}");
            });
          }
          return Container(
            padding:
                const EdgeInsets.only(right: 30, left: 30, top: 10, bottom: 10),
            child: Row(children: [
              if (icon != null) Icon(icon),
              SizedBox(
                  height: 40,
                  child: Text(
                    label,
                    style: highlight
                        ? TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)
                        : TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                  )),
            ]),
          );
        }),
      ),
    );
  }
}

class SubMenu extends GetView<NavController> {
  String label;
  String route;
  bool highlight = false;
  IconData? icon;
  SubMenu(
      {super.key,
      required this.label,
      required this.route,
      this.highlight = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    highlight = controller.navPage == route;

    return Row(children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 2))),
          // padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              log("Tapped : ${label}");
              controller.changeMenu(label, route);
              Get.toNamed(route);
            },
            onHover: (value) {
              if (value) controller.toggleSubMenu(route, value);
            },
            child: Builder(builder: (BuildContext context) {
              if (highlight) {
                SchedulerBinding.instance
                    .addPostFrameCallback((Duration timeStamp) {
                  Scrollable.ensureVisible(context, alignment: 0.5);
                  // log("Selection : ${(options.elementAt(index) as Item).name}");
                });
              }
              return Container(
                  color:
                      highlight ? Colors.amber.shade200 : Colors.grey.shade300,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    if (icon != null) Icon(icon),
                    SizedBox(
                        height: 50,
                        child: Text(label,
                            style:
                                highlight ? tableFooterStyle : navTextStyle)),
                  ]));
            }),
          ),
        ),
      ),
    ]);
  }
}
