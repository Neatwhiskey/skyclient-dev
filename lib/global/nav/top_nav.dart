import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skyclient/global/controllers/app_controller.dart';
import 'package:skyclient/global/nav/top_menu.dart';

class TopNav extends ConsumerWidget {
  TopNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BoxConstraints constraints = AppController.viewConstraints;
    // final int offlineCounter =
    //     ref.watch(offlineNotifier.select((sc) => sc.offlineCounter));
    // final Color onBkgColor =
    //     ref.watch(offlineNotifier.select((sc) => sc.onBkgColor));
    // final Color offBkgColor =
    //     ref.watch(offlineNotifier.select((sc) => sc.offBkgColor));

    return Visibility(
      visible: true,
      child: SizedBox(
        height: 50,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Visibility(
              //     visible: AppController.connectedOnline,
              //     child: NavMenu(
              //       label: "Home",
              //     )),
              Visibility(
                  visible: true,
                  child: TopMenu(
                    label: "Dashboard",
                    route: "/dasboard",
                  )),
              Visibility(
                visible: false,
                child: TopMenu(
                  label: "Tests",
                  route: "/sale",
                ),
              ),
              Visibility(
                visible: true,
                child: TopMenu(
                  label: "Temp",
                  route: "/temp",
                ),
              ),
              // Visibility(
              //     visible: navPage.startsWith("/sale") || saleMenu,
              //     child: SubMenu(
              //       label: "All",
              //       route: "/sale/all",
              //     )),
              // Visibility(
              //     visible: navPage.startsWith("/sale") || saleMenu,
              //     child: SubMenu(
              //       label: "Sale Return",
              //       route: "/sale/return",
              //     )),
              Visibility(
                visible: false,
                child: TopMenu(
                  label: "Charts",
                  route: "/purchase",
                ),
              ),
              Visibility(
                  // visible:
                  //     navPage.startsWith("/purchase") || purchaseMenu,
                  child: TopMenu(
                label: "Questions",
                route: "/question",
              )),
              // Visibility(
              //     visible:
              //         navPage.startsWith("/purchase") || purchaseMenu,
              //     child: SubMenu(
              //       label: "Receive",
              //       route: "/purchase/receive",
              //     )),
              Visibility(
                visible: false,
                child: TopMenu(
                  label: "Profile",
                  route: "/payment",
                ),
              ),
              // Visibility(
              //   // visible: hasSale || AppController.connectedOnline,
              //   child: TopMenu(
              //     label: "Production",
              //     route: "/production",
              //   ),
              // ),
              // Visibility(
              //     visible: navPage.startsWith("/payment") || paymentMenu,
              //     child: SubMenu(
              //       label: "All",
              //       route: "/payment/all",
              //     )),

              // Visibility(
              //     visible: navPage.startsWith("/setup") || setupMenu,
              //     child: SubMenu(
              //       label: "Company",
              //       route: "/setup/company",
              //     )),
              // Visibility(
              //     visible: navPage.startsWith("/setup") || setupMenu,
              //     child: SubMenu(
              //       label: "Branch",
              //       route: "/setup/shop",
              //     )),
              // Visibility(
              //     visible: navPage.startsWith("/setup") || setupMenu,
              //     child: SubMenu(
              //       label: "Store",
              //       route: "/setup/store",
              //     )),
              // Visibility(
              //     visible: navPage.startsWith("/setup") || setupMenu,
              //     child: SubMenu(
              //       label: "Staff",
              //       route: "/setup/staff",
              //     )),
              // Visibility(
              //     visible: navPage.startsWith("/setup") || setupMenu,
              //     child: SubMenu(
              //       label: "Item",
              //       route: "/setup/item",
              //     )),
              // Visibility(
              //     visible: navPage.startsWith("/setup") || setupMenu,
              //     child: SubMenu(
              //       label: "Customer",
              //       route: "/setup/customer",
              //     )),
              // Visibility(
              //     visible: navPage.startsWith("/setup") || setupMenu,
              //     child: SubMenu(
              //       label: "Supplier",
              //       route: "/setup/supplier",
              //     )),
              // Visibility(
              //     visible: navPage.startsWith("/setup") || setupMenu,
              //     child: SubMenu(
              //       label: "Account",
              //       route: "/setup/account",
              //     )),
              // Visibility(
              //     visible: hasStore || AppController.connectedOnline,
              //     child: NavMenu(label: "Items")),
              // NavMenu(label: "Sale Return"),
              // Visibility(
              //     visible: Navigator.canPop(context),
              //     child: NavMenu(
              //       label: "Back",
              //       route: "/back",
              //       icon: Icons.arrow_back_sharp,
              //     )),
            ],
          ),
        ]),
      ),
    );
  }
}
