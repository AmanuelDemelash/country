import 'package:flutter/material.dart';

import '../constant/colorConstant.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "interFont",
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorConstant.blueDark_900,
    brightness: Brightness.light,
  ),
  // iconTheme: const IconThemeData(color: ColorConstant.blue_50),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          textStyle: const TextStyle(color: ColorConstant.blueDark_50))),

  visualDensity: VisualDensity.adaptivePlatformDensity,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "interFont",
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorConstant.blueDark_900,
    brightness: Brightness.dark,
  ),
  // iconTheme: const IconThemeData(color: ColorConstant.blue_50),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          textStyle: const TextStyle(color: ColorConstant.blueDark_50))),

  visualDensity: VisualDensity.adaptivePlatformDensity,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);
