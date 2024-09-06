import 'package:country/app/constant/colorConstant.dart';
import 'package:country/app/data/models/country_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/country_detail_controller.dart';

class CountryDetailView extends GetView<CountryDetailController> {
   CountryDetailView({super.key});
  final Country country=Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon:const Icon(Icons.arrow_back_ios,color: ColorConstant.blue_50,)),
        title:Text(country.name!.common!),
        titleTextStyle: TextStyle(color: ColorConstant.blue_50),
        centerTitle: true,
      ),
      body:Center(
        child: Text(
          country.name!.common!,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
