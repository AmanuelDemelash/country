import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/colorConstant.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return  Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            SizedBox(
              width: Get.width,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:"https://i.postimg.cc/Qtxc8xgv/welcome-image.png",
                  placeholder: (context, url) => Icon(
                    Icons.image,
                    color: ColorConstant.blueDark_800.withOpacity(0.6),
                  ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
            ),
            const Spacer(flex: 3),
            Text(
              "Welcome to GlobeGuide \ncountry app",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              "Your Global Guide to Every Nation.\n  Country Companion.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.64),
              ),
            ),
            const Spacer(flex: 1),
            Center(child: CircularProgressIndicator(),),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
