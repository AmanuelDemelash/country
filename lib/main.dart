import 'package:country/app/bindings/app_bindings.dart';
import 'package:country/app/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('setting');
  await Hive.openBox('favorite');
  Box sbox = Hive.box('setting');
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GlobeGuide",
      initialBinding: AppBinding(),
      theme: sbox.get("isdark") == null
          ? darkTheme
          : sbox.get("isdark")
              ? darkTheme
              : lightTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
