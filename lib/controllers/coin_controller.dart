import 'package:get/get.dart';
import 'package:shopping/shopping/helper/repositories/Coinrepo.dart';

import '../shopping/models/ohlc_model.dart';

class CoinController extends GetxController{
  CoinRepo coinRepo;
  CoinController({required this.coinRepo});
  List<CryptoModel> cryptolist=[];
  late CryptoModel cryptomodel;
  late Map<String, dynamic> map1={};
  late List<Map> listtobemap=[];
  List coinPrice=[];

  int? time;
  double? open;
  double? high;
  double? low;
  double? close;
  double volume=1000;

   getCoinList()async{
     var body = await coinRepo.getCoinPrice();
     cryptolist=[];
     listtobemap=[];
     coinPrice=[];
     try{cryptolist.addAll(CryptoPrices.fromJson(body.body).cryptoMod);}catch(e){
       print("ok this is cazzzzzzzy $e");
     }
     update();

     //print(cryptomodel.listtobemap[3].keys);

     for (var element in cryptolist) {
     map1={'time':time=element.time,
       'open': open=element.open,
       "high":high=element.high,
       "low": low=element.low,
       "close": close=element.close,
       "volumeto": 100,
     };
     listtobemap.add(map1);}
     print(listtobemap.length);
   }

}