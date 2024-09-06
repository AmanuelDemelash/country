import 'package:cached_network_image/cached_network_image.dart';
import 'package:country/app/constant/colorConstant.dart';
import 'package:country/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/loading_shimmer.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final SearchController searchController = SearchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {
        controller.getAllCountries();
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              PopupMenuButton(
                icon: const Icon(Icons.filter_sharp),
                itemBuilder: (context) {
                  return List.generate(
                    controller.regions.length,
                    (index) =>
                        PopupMenuItem(child: Text(controller.regions[index])),
                  );
                },
              ),
              SearchAnchor(
                dividerColor: ColorConstant.blue_50,
                isFullScreen: false,
                searchController: searchController,
                viewHintText: "search Country",
                viewLeading: IconButton(
                    onPressed: () {
                      controller.searchCountries.value.clear();
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                builder: (context, controller) {
                  return const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.search),
                  );
                },
                suggestionsBuilder: (context, controller) => [],
                keyboardType: TextInputType.name,
                viewOnChanged: (value) => controller.searchName(value),
                viewBuilder: (suggestions) {
                  return SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: GetX(
                      init: controller,
                      builder: (controller) => controller.isSearchNmae.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : controller.searchCountries.value.isEmpty
                              ? const Center(child: Text("no country found"))
                              : ListView.builder(
                                  padding: const EdgeInsets.all(15),
                                  itemCount:
                                      controller.searchCountries.value.length,
                                  itemBuilder: (context, index) => ListTile(
                                        onTap: () => Get.toNamed(
                                            Routes.COUNTRY_DETAIL,
                                            arguments: controller
                                                .searchCountries.value[index]),
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Hero(
                                            tag: controller
                                                .allCountries.value[index],
                                            child: CachedNetworkImage(
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.fill,
                                              imageUrl: controller
                                                  .searchCountries
                                                  .value[index]
                                                  .flags!
                                                  .png!,
                                              placeholder: (context, url) =>
                                                  Icon(
                                                Icons.image,
                                                color: ColorConstant
                                                    .blueDark_800
                                                    .withOpacity(0.6),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        title: Text(controller.searchCountries
                                            .value[index].name!.common!),
                                      )),
                    ),
                  );
                },
              )
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
                return controller.loadCountries.value
                    ? const loadingShimmer()
                    : Card(
                        elevation: 0,
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 4),
                        child: ListTile(
                          key: ValueKey('$index'),
                          trailing: const Icon(Icons.arrow_right),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Hero(
                              tag: controller.allCountries.value[index],
                              child: CachedNetworkImage(
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                                imageUrl: controller
                                    .allCountries.value[index].flags!.png!,
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
                          title: Text(controller
                                  .allCountries.value[index].name?.common ??
                              'Unknown'),
                          subtitle: Text(controller
                                  .allCountries.value[index].region?.name ??
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
      ),
    ));
  }
}
