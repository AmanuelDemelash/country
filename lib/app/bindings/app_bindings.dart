import 'package:get/get.dart';
import '../data/provider/api_provider.dart';

class AppBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ApiProvider());
  }

}