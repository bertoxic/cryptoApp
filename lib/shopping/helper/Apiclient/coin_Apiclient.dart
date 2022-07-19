

import 'package:get/get.dart';

class CoinApiClient extends GetConnect implements GetxService {
  String CoinBaseUrl;

  CoinApiClient({required this.CoinBaseUrl}) {
    baseUrl = CoinBaseUrl;
    timeout = Duration(seconds: 30);

    }
  Future<Response> getCoinData(String url) async {
    Response response = await get(url);
    return response;
  }
}