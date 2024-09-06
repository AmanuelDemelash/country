import 'package:flutter/material.dart';

import '../constant/colorConstant.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "interFont",
  colorSchemeSeed: ColorConstant.blueDark_900,
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorConstant.blue_50,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorConstant.blueDark_900,
    centerTitle: false,
    elevation: 0
  ),
  // iconTheme: const IconThemeData(color: ColorConstant.blue_50),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          textStyle: const TextStyle(color: ColorConstant.blue_50))),
  navigationBarTheme: const NavigationBarThemeData(
    elevation: 0,
    backgroundColor: ColorConstant.blueDark_800,
    indicatorColor: ColorConstant.blue_800,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
  ),

  expansionTileTheme: const ExpansionTileThemeData(
    backgroundColor: ColorConstant.blue_800,
    collapsedBackgroundColor: ColorConstant.blue_900,
    clipBehavior: Clip.none,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);
