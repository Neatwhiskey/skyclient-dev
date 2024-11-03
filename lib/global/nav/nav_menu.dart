import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:skyclient/global/nav/nav_controller.dart';
import 'package:skyclient/global/styles.dart';

class NavMenu extends GetView<NavController> {
  String label;
  String route;
  bool highlight = false;
  IconData? icon;

  NavMenu({
    super.key,
    required this.label,
    required this.route,
    this.highlight = false,
    this.icon,
  });

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
              if (value) controller.toggleMenu(label, value);
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
                color: highlight ? Colors.amber.shade200 : null,
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  if (icon != null) Icon(icon),
                  SizedBox(
                      height: 20,
                      child: Text(label,
                          style: highlight ? tableFooterStyle : navTextStyle)),
                ]),
              );
            }),
          ),
        ),
      ),
    ]);
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
                color: highlight ? Colors.blue.shade100 : Colors.grey.shade300,
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(children: [
                    if (icon != null) Icon(icon),
                    SizedBox(
                        height: 20,
                        child: Text(label,
                            style:
                                highlight ? tableFooterStyle : navTextStyle)),
                  ]),
                ),
              );
            }),
          ),
        ),
      ),
    ]);
  }
}
