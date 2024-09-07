import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FavoriteController extends GetxController {
  late Box _boxFavorite;

  RxList<dynamic> allFavorite=RxList<dynamic>();

  @override
  void onInit() {
    super.onInit();
    _boxFavorite=Hive.box('favorite');
    getFavorites();

  }

  Future<void> getFavorites()async{
    allFavorite.clear();
    var favorites= _boxFavorite.keys.cast().toList();
    allFavorite.addAll(favorites.toList());
  }
  Future<void> clearFavorites()async{
    _boxFavorite.clear();
    allFavorite.clear();
  }
}
