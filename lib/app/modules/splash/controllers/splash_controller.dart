import 'package:country/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds:4),() => Get.offAllNamed(Routes.HOME),);
  }
}
