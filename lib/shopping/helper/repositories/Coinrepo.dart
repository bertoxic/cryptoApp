
import 'package:get/get.dart';
import 'package:shopping/shopping/helper/Apiclient/coin_Apiclient.dart';
import 'package:shopping/shopping/models/ohlc_model.dart';

class CoinRepo extends GetxService{
  CoinApiClient coinApiClient;
  //List<Map> cryptolist=[];
  
  CoinRepo({required this.coinApiClient});
  
  Future<Response> getCoinPrice()async{
    var response= await coinApiClient.getCoinData('/api/v3/coins/ethereum/ohlc?vs_currency=usd&days=7');
   // print(response.body.toString());
   // List newlist= response.body;
    //cryptolist=[];
   // cryptolist.add(CryptoPrices.fromJson(response.body).map1);
   // print(cryptolist.length);

    return response;
  }
  
}