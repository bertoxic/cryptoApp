

import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  String appBaseUrl;
  ApiClient({required this.appBaseUrl}){
    timeout=Duration(seconds: 30);
    baseUrl=appBaseUrl;
  }


  Future<Response> getData(String url)async{
     Response response =await get(url);
     return response;
}




}