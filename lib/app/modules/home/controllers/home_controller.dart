import 'package:country/app/data/models/country_model.dart';
import 'package:get/get.dart';

import '../../../data/provider/api_provider.dart';

class HomeController extends GetxController {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();
  Rx<List<Country>> allCountries= RxList<Country>().obs;
  RxBool loadCountries=false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllCountries();
  }

  //get all countries
Future<void> getAllCountries()async {
    loadCountries.value=true;
  try{
   var response= await _apiProvider.getAllCountries();
     if (response!.statusCode == 200) {
       allCountries.value.addAll(countryFromJson(response.bodyString!).toList()); //);
       loadCountries.value=false;
     } else {
      loadCountries.value=false;
     }
  } catch (e) {
    loadCountries.value=false;
  }

}

}
