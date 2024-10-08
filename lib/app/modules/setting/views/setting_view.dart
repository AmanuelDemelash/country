import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Card(
                elevation: 0,
                child: Obx(() => SwitchListTile.adaptive(
                      value: controller.isDark.value,
                      title: const Text("Theme(dark)"),
                      onChanged: (value) {
                        controller.changeTheme(value);
                      },
                    )),
              )
            ],
          ),
        ));
  }
}
