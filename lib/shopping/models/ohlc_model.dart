
class CryptoPrices{
  List <CryptoModel> cryptoMod=[];

  CryptoPrices.fromJson(List<dynamic> prices){
    if(prices!=null){
      for (var element in prices){
        cryptoMod.add(CryptoModel.fromJson(element));
      }
    }
    
  }
  
}


class CryptoModel{
  int? time;
  double? open;
  double? high;
  double? low;
  double? close;
  double volume=10000;
  //List<Map> listtobemap=[];
  //late Map<String, dynamic> map1={'open':78,'heyy':65,};


  CryptoModel.fromJson(List<dynamic> element){
    if(element!=null){
      print('price is not null');
      //for (var element in prices) {
        // map1={'time':time=element[0],
        //   'open': open=element[1],
        //   "high":high=element[2],
        //   "low": low=element[3],
        //   "close": close=element[3],
        //   "volumeto": 10000,
       // };
        //listtobemap.add(map1);

        time=element[0];
        open=element[1];
        high=element[2];
        low=element[3];
        close=element[4];
      //}
     // print(listtobemap[9].keys);
    }
  }

}