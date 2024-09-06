import 'package:get/get.dart';

import '../controllers/country_detail_controller.dart';

class CountryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountryDetailController>(
      () => CountryDetailController(),
    );
  }
}
