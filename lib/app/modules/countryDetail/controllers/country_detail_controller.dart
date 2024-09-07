import 'package:country/app/data/models/country_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CountryDetailController extends GetxController {

  late Box _boxFavorite;
  RxBool isFavorite=false.obs;

  @override
  void onInit() {
    super.onInit();
    _boxFavorite=Hive.box('favorite');

  }

  Future<void> addFavorite(Country country)async{
     _boxFavorite.put(country.name!.common,{"name":country.name!.common,"flag":country.flags!.png!});
     isFavorite.value=true;
  }
  Future<void> deleteFavorite(Country country)async{
    _boxFavorite.delete(country.name!.common);
    isFavorite.value=false;
  }
  Future<void> checkFavorite(String name)async{
     isFavorite.value=_boxFavorite.containsKey(name);
 }

}
