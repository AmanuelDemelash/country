import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:country/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  late  StreamSubscription subscription;
  @override
  void onInit() {
    super.onInit();
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      // Received changes in available connectivity types!
      for (var element in result) {
        if(element==ConnectivityResult.none){
          Get.rawSnackbar(title: "connection lost",message: "please cheek your internet connection",
              backgroundColor: Colors.redAccent,
              icon: const Icon(Icons.signal_wifi_connected_no_internet_4),
              isDismissible: false,
              barBlur: 0.9,
              duration: const Duration(days: 1)
          );
        }else{
          if(Get.isSnackbarOpen){
            Get.closeCurrentSnackbar();
          }
        }
      }
    });
    Future.delayed(const Duration(seconds:4),() => Get.offAllNamed(Routes.HOME),);
  }
}
