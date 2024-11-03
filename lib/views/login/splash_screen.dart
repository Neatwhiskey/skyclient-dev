import 'dart:developer';

import 'package:skyclient/global/controllers/app_controller.dart';
import 'package:skyclient/global/widgets/almond_app.dart';
import 'package:skyclient/main.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 107, 135, 219),
          Colors.blue,
        ],
      ),
      childWidget: SizedBox(
        height: 150,
        child: Image.asset("assets/images/almond_logo.jpg"),
      ),
      duration: const Duration(milliseconds: 3000),
      animationDuration: const Duration(milliseconds: 1000),
      onAnimationEnd: () => defaultTargetPlatform == TargetPlatform.windows
          ? windowManager.maximize()
          : null,
      defaultNextScreen: AlmondApp(),
      setNextScreenAsyncCallback: () async {
        log("Splash Screen async callback : ${DateTime.now()}");
        String? deviceId = await storage.getDeviceId();
        String? str = await storage.getKeyValue("db_initialized");

        if (deviceId != null) {
          log("deviceId read : $deviceId");
          String? clientId = await storage.getClientId();
          if (clientId != null) {
            // String? busName = await storage.getKeyValue("busName");
            // if (busName == null) {
            //   busName ??= "Almond Client";
            //   AppController.setupdone = false;

            // } else {
            //   AppController.setupdone = true;
            // }

            AppController.clientId = clientId;
            return AlmondApp();
          } else {
            log("clientId is null");
          }
        } else {
          log("deviceId is null");
          deviceId = await storage.readDeviceId();
          if (deviceId != null) {
            log("deviceId created : $deviceId");
            storage.saveDeviceId(deviceId);
          }
        }

        return AlmondApp();
      },
    );
  }
}
