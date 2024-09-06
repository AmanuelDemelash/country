import 'package:cached_network_image/cached_network_image.dart';
import 'package:country/app/constant/colorConstant.dart';
import 'package:country/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(slivers: [
        SliverAppBar(
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
          pinned: true,
          snap: true,
          floating: true,
          expandedHeight: 100,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('Countries',style: TextStyle(color: ColorConstant.blue_50),),
            collapseMode: CollapseMode.parallax,
            centerTitle: true,
          ),
        ),
        Obx(() => SliverList(delegate:SliverChildBuilderDelegate((context, index) {
                     final country =controller.allCountries.value.length;
                     return controller.loadCountries.value?
                     CircularProgressIndicator():
                       ListTile(
                       key: ValueKey('$index'),
                       leading: CachedNetworkImage(
                         width: 60,
                         height: 80,
                         imageUrl:controller.allCountries.value[index].flags!.png!,
                         placeholder: (context, url) => const Icon(Icons.image),
                         errorWidget: (context, url, error) => const Icon(Icons.error),
                       ),
                       title: Text(controller.allCountries.value[index].name?.common ?? 'Unknown'),
                       subtitle: Text(controller.allCountries.value[index].region?.name ?? 'No capital'),
                       onTap: () => Get.toNamed(Routes.COUNTRY_DETAIL,arguments:controller.allCountries.value[index]),
                     );
         },
         childCount: controller.allCountries.value.length,
         )),
       )

      ],)

    );
  }
}
