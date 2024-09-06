import 'package:cached_network_image/cached_network_image.dart';
import 'package:country/app/constant/colorConstant.dart';
import 'package:country/app/data/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/country_detail_controller.dart';

class CountryDetailView extends GetView<CountryDetailController> {
  CountryDetailView({super.key});
  final Country country = Get.arguments;
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
    return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                launchUrl(
                  Uri.parse(country.maps!.googleMaps!),
                  mode: LaunchMode.inAppBrowserView,
                );
              },
              child: const Icon(Icons.location_pin),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                launchUrl(
                  Uri.parse(country.maps!.openStreetMaps!),
                  mode: LaunchMode.inAppBrowserView,
                );
              },
              child: const Icon(Icons.map),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  )),
              actions: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.favorite_border,
                    )),
              ],
              pinned: true,
              snap: true,
              floating: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(country.flag.toString()),
                    Expanded(
                        child: Text(
                      country.name!.common!,
                      overflow: TextOverflow.ellipsis,
                    )),
                  ],
                ),
                background: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: Hero(
                    tag: country,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: country.flags!.png!,
                      placeholder: (context, url) => Icon(
                        Icons.image,
                        color: ColorConstant.blueDark_800.withOpacity(0.6),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              //detail info
              Container(
                width: Get.width,
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text(
                      "Detail Information",
                      style: textStyle,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Name:  ",
                          style: textStyle,
                        ),
                        Text(country.name!.common!),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Official Name: ",
                          style: textStyle,
                        ),
                        Expanded(child: Text(country.name!.official!)),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Independent: ",
                          style: textStyle,
                        ),
                        Text(country.independent.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Status: ",
                          style: textStyle,
                        ),
                        Text(country.status!.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "UnMember: ",
                          style: textStyle,
                        ),
                        Text(country.unMember.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Land Locked: ",
                          style: textStyle,
                        ),
                        Text(country.landlocked!.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Population: ",
                          style: textStyle,
                        ),
                        Text(country.population!.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Lat/Lng: ",
                          style: textStyle,
                        ),
                        Text("${country.latlng![0]}/${country.latlng![1]}"),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Start of week: ",
                          style: textStyle,
                        ),
                        Text(country.startOfWeek.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Time Zone: ",
                          style: textStyle,
                        ),
                        Expanded(
                            child: Text(
                          country.timezones.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Car Side: ",
                          style: textStyle,
                        ),
                        Text(country.car!.side!.name),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("currencies: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: country.currencies!.entries.map((entry) {
                            String languageCode = entry.key.toUpperCase();
                            String name = entry.value.name ?? '';
                            String symbol = entry.value.symbol ?? '';
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("$name($languageCode)"),
                                      Text(symbol)
                                      // Text('Common: $commonName'),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  thickness: 1,
                ),
              ),
              // geography
              Container(
                width: Get.width,
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text(
                      "Geography",
                      style: textStyle,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Region: ",
                          style: textStyle,
                        ),
                        Text(country.region!.name),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "SubRegion: ",
                          style: textStyle,
                        ),
                        Text(country.subregion ?? ""),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Capital: ",
                          style: textStyle,
                        ),
                        Text(country.capital![0]),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Demonym: ",
                          style: textStyle,
                        ),
                        Text(country.demonyms!.eng!.f!),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Area: ",
                          style: textStyle,
                        ),
                        Text("${country.area!}m²"),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Lat/Lng: ",
                          style: textStyle,
                        ),
                        Text("${country.latlng![0]}/${country.latlng![1]}"),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Borders: ",
                          style: textStyle,
                        ),
                        country.borders != null
                            ? Expanded(
                                child: Wrap(
                                  children: List.generate(
                                    country.borders!.length,
                                    (index) =>
                                        Text("${country.borders![index]} / "),
                                  ),
                                ),
                              )
                            : const Text("")
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  thickness: 1,
                ),
              ),
              //language
              Container(
                width: Get.width,
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text(
                      "Language",
                      style: textStyle,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: country.languages!.entries.map((entry) {
                        String languageCode = entry.key.toUpperCase();
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(languageCode,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Official: ${languageCode}'),
                                  // Text('Common: $commonName'),
                                ],
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  thickness: 1,
                ),
              ),
              // translation
              Container(
                width: Get.width,
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text(
                      "Translations",
                      style: textStyle,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: country.translations!.entries.map((entry) {
                        String languageCode = entry.key.toUpperCase();
                        String officialName = entry.value.official ?? '';
                        String commonName = entry.value.common ?? '';
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(languageCode,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Official: $officialName',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text('Common: $commonName'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ]))
          ],
        ));
  }
}
