
import 'package:get/get.dart';
import 'package:shopping/controllers/coin_controller.dart';
import 'package:shopping/controllers/newsController.dart';
import 'package:shopping/shopping/helper/Apiclient/apiclient.dart';
import 'package:shopping/shopping/helper/Apiclient/coin_Apiclient.dart';
import 'package:shopping/shopping/helper/repositories/Coinrepo.dart';
import 'package:shopping/shopping/helper/repositories/newsrepo.dart';

Future<void> init() async {

  Get.lazyPut(()=>ApiClient(appBaseUrl: "https://newsdata.io/"));
  Get.lazyPut(() => NewsRepo(apiClient: Get.find()));
  Get.lazyPut(() => NewsController(newsRepo: Get.find()));

  //CoinGekco Api call
  Get.lazyPut(() => CoinApiClient(CoinBaseUrl: "https://api.coingecko.com/"));
  Get.lazyPut(() => CoinRepo(coinApiClient: Get.find()));
  Get.lazyPut(()=>CoinController(coinRepo: Get.find()));

}