
import 'package:country/app/data/provider/api_endpoints.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect{
  @override
  void onInit() {
    httpClient.baseUrl="https://restcountries.com/v3.1";
    super.onInit();
  }

  // get all countries
  Future<Response?> getAllCountries() async {
    try {
      final response = await get(ApiEndpoints.allCountries);
      return response;
    } catch (e) {
      return const Response(statusCode: 501, statusText: "error");
    }
  }
}