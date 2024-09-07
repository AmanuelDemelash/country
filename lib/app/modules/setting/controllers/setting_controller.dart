import 'package:country/app/theme/theme_data.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SettingController extends GetxController {
  late Box _box;

  RxBool isDark = false.obs;
  @override
  void onInit() {
    super.onInit();
    _box = Hive.box('setting');
    isDark.value = _box.get('isdark') ?? false;
  }

  Future<void> changeTheme(bool value) async {
    _box.put("isdark", value);
    isDark.value = value;
    if (value) {
      Get.changeTheme(darkTheme);
    } else {
      Get.changeTheme(lightTheme);
    }
  }
}
