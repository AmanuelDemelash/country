import 'package:cached_network_image/cached_network_image.dart';
import 'package:country/app/constant/colorConstant.dart';
import 'package:country/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/loading_shimmer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ))
          ],
          pinned: true,
          snap: true,
          floating: true,
          expandedHeight: 160,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text(
              'Countries',
              style: TextStyle(),
            ),
            collapseMode: CollapseMode.parallax,
            centerTitle: true,

          ),
        ),
        Obx(
          () => SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final country = controller.allCountries.value.length;
              return controller.loadCountries.value
                  ? const loadingShimmer()
                  : Card(
                    elevation: 0,
                    margin: const EdgeInsets.only(left: 15,right: 15,bottom: 4),
                    child: ListTile(
                        key: ValueKey('$index'),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Hero(
                            tag:controller.allCountries.value[index] ,
                            child: CachedNetworkImage(
                              width: 40,
                              height: 40,
                              fit: BoxFit.fill,
                              imageUrl:
                                  controller.allCountries.value[index].flags!.png!,
                              placeholder: (context, url) => Icon(
                                Icons.image,
                                color: ColorConstant.blueDark_800.withOpacity(0.6),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        title: Text(
                            controller.allCountries.value[index].name?.common ??
                                'Unknown'),
                        subtitle: Text(
                            controller.allCountries.value[index].region?.name ??
                                'No capital'),
                        onTap: () => Get.toNamed(Routes.COUNTRY_DETAIL,
                            arguments: controller.allCountries.value[index]),
                      ),
                  );
            },
            childCount: controller.loadCountries.value
                ? 10
                : controller.allCountries.value.length,
          )),
        )
      ],
    ));
  }
}
