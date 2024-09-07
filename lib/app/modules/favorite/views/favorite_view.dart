import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../constant/colorConstant.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    controller.getFavorites();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){controller.clearFavorites();}, icon:const Icon(Icons.delete))
        ],
      ),
      body:Obx(() =>controller.allFavorite.isEmpty? const Center(child: Text("no favorite country"),)
          :ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: controller.allFavorite.length,
        itemBuilder: (context, index) {
          Box boxFavorite=Hive.box('favorite');
          var country =boxFavorite.getAt(index) as Map;
          String countryName = country['name'];
          String countryFlag = country['flag'];
          return Card(
              elevation: 0,
              child: ListTile(
                title: Text(countryName),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                      width: 40,
                      height: 40,
                      fit: BoxFit.fill,
                      imageUrl:countryFlag,
                      placeholder: (context, url) => Icon(
                        Icons.image,
                        color: ColorConstant.blueDark_800
                            .withOpacity(0.6),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ),
                ),
              ),
          );
      },))
    );
  }
}
