import 'package:country/app/data/models/country_model.dart';
import 'package:get/get.dart';

import '../../../data/provider/api_provider.dart';

class HomeController extends GetxController {
  RxInt bottomNavIndex = 0.obs;
  final ApiProvider _apiProvider = Get.find<ApiProvider>();
  Rx<List<Country>> allCountries = RxList<Country>().obs;
  Rx<List<Country>> searchCountries = RxList<Country>().obs;

  RxList regions = [].obs;

  RxBool loadCountries = false.obs;
  RxBool isSearchNmae = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllCountries();
  }

  //get all countries
  Future<void> getAllCountries() async {
    loadCountries.value = true;
    try {
      var response = await _apiProvider.getAllCountries();
      if (response!.statusCode == 200) {
        allCountries.value
            .addAll(countryFromJson(response.bodyString!).toList()); //);
        getRegions();
        loadCountries.value = false;
      } else {
        loadCountries.value = false;
      }
    } catch (e) {
      loadCountries.value = false;
    }
  }

  Future<void> searchName(String name) async {
    isSearchNmae.value = true;
    try {
      var response = await _apiProvider.searchCountriesName(name);
      if (response!.statusCode == 200) {
        searchCountries.value
            .addAll(countryFromJson(response.bodyString!).toList());
        isSearchNmae.value = false;
      }
    } catch (e) {
      isSearchNmae.value = false;
    }
  }

  Future<void> getRegions() async {
    if (regions.isEmpty) {
      regions.addAll(allCountries.value
          .map(
            (e) => e.region!.name,
          )
          .toSet()
          .toList());
    }
  }
}
