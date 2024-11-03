import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyclient/global/nav/top_nav.dart';
import 'package:skyclient/global/styles.dart';

import 'package:skyclient/views/login/login_controller.dart';

class AlmondAppBar extends GetView<LoginController> {
  String busName = "Almond";
  static DateTime lastChecked =
      DateTime.now().subtract(const Duration(minutes: 6));

  // static UpdatWidget updateWidget = UpdatWidget(
  //   currentVersion: AppController.clientVersion,
  //   getLatestVersion: () async {
  //     DateTime now = DateTime.now();
  //     if (now.difference(lastChecked).inMinutes < 5)
  //       return AppController.clientVersion;
  //     log("Checking update version at $now");
  //     try {
  //       Response res = Response(requestOptions: RequestOptions());
  //       if (defaultTargetPlatform == TargetPlatform.windows)
  //         res = await Api.dio.get(
  //             "${Api.webalmond}/Almondrest/genservice/latestClientVersion?clientVersion=${AppController.clientVersion}&serverVersion=${AppController.serverVersion}&type=Windows");
  //       else
  //         res = await Api.dio.get(
  //             "${Api.webalmond}/Almondrest/genservice/latestClientVersion?clientVersion=${AppController.clientVersion}&type=Android");
  //       log("Received $res");
  //       if (res.statusCode == 200) {
  //         lastChecked = now;
  //         if (res.data != AppController.clientVersion) {
  //           double version =
  //               double.parse(res.data.toString().replaceAll(".", ""));
  //           double current = double.parse(
  //               AppController.clientVersion.toString().replaceAll(".", ""));
  //           if (version > current)
  //             showWarningToast(fToast, "Update Available : ${res.data}");
  //         }
  //         return res.data;
  //       } else
  //         return AppController.clientVersion;
  //     } catch (err) {
  //       log(err.toString());
  //       return AppController.clientVersion;
  //     }
  //     // return "localhost:8080/rest/generalservice/latestClientVersion?clientVersion=${AppController.clientVersion}&serverVersion=3.5.0";
  //   },
  //   getBinaryUrl: (latestVersion) async {
  //     // Here you provide the link to the binary the user should download. Make sure it is the correct one for the platform!
  //     if (defaultTargetPlatform == TargetPlatform.windows)
  //       return "${Api.webalmond}/Almondrest/genservice/downloadClientVersion?version=${latestVersion}&type=exe";
  //     else
  //       return "${Api.webalmond}/Almondrest/genservice/downloadClientVersion?version=${latestVersion}&type=apk";
  //   },

  //   // Lastly, enter your app name so we know what to call your files.
  //   appName: "Almond Client",
  //   openOnDownload: isWindows,
  //   getChangelog: (latestVersion, appVersion) {
  //     return Future(() => "Latest Version Changes :");
  //   },
  //   getDownloadFileLocation: (latestVersion) {
  //     if (isWindows)
  //       return Future(
  //           () => File("C:/Almond/AlmondClient-${latestVersion}.exe"));
  //     else
  //       return getDownloadFileLocation(
  //         latestVersion!.toString(),
  //         "AlmondClient",
  //         "apk",
  //       );
  //   },
  //   closeOnInstall: true,
  // );

  AlmondAppBar({super.key}) {}

  @override
  Widget build(BuildContext context) {
    // final connectController = ref.watch(connectNotifier);

    String? userName = controller.userName;
    bool loggedIn = controller.loggedIn;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                child: const Text(
                  "Sky Test",
                  overflow: TextOverflow.clip,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 3,
                    // fontFamily: GoogleFonts.alata().fontFamily,
                  ),
                ),
                onTap: () {
                  // NavController navController = ref.read(navNotifier);
                  // navController.changePage("/dashboard");
                  Get.toNamed("/");
                },
              )),
        ),
        Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(),
              child: TopNav(),
            )),
        Visibility(
          visible: MediaQuery.of(context).size.width > 600,
          child: Expanded(
            flex: 1,
            child: Visibility(
              visible: loggedIn,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.account_circle),
                      Text(
                        userName ?? "Unknown",
                        style: labelTextStyle,
                      ),
                      const SizedBox(
                        width: 10,
                        height: 5,
                      ),
                      // TextButton.icon(
                      //     onPressed: () {
                      //       LoginController loginController =
                      //           ref.read(loginNotifier);
                      //       loginController
                      //           .logout(storage.clientId)
                      //           .then((res) {
                      //         loginController.userName = "";
                      //         loginController.username = "";
                      //         LoginController.sessionId = "";
                      //         loginController.userRoles = [];
                      //         loginController.userRights = [];
                      //         loginController.loggedIn = false;
                      //         loginController.lastUserId =
                      //             loginController.userId;
                      //         loginController.lastPage = router.location;
                      //         api.sessionId = "";
                      //         LoginController.sessionId = "";
                      //         LoginController.isAdmin = false;
                      //         LoginController.isOwner = false;
                      //         // routeReplace(context, LoginPage());
                      //         router.go("/Login");
                      //         if (res.status != 1) {
                      //           showWarningToast(fToast, res.msg);
                      //         } else
                      //           showSuccessToast(fToast, res.msg);
                      //       });
                      //     },
                      //     icon:
                      //         Icon(Icons.logout, color: Colors.yellow.shade600),
                      //     label: Text("")),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
