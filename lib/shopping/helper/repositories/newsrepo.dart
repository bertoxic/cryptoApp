
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/newsController.dart';
import 'package:shopping/shopping/helper/Apiclient/apiclient.dart';
import 'package:shopping/shopping/models/newsModel.dart';

class NewsRepo extends GetxService{
ApiClient apiClient;
NewsRepo({required this.apiClient});
List<NewsModel> newsList=[];
  Future<Response> getNewsList()async{
     var response = await apiClient.getData('api/1/news?apikey=pub_7915c9cba04a77911210953dfeef564527a4&language=en&q=crypto');
     if(response.statusCode!=200){
       print('server side error ${response.statusText}?');
     }
     // Map<String ,dynamic>map=response.body;
     // List<dynamic> data =map['results'];
     // newsList.add(NewsModel.bloodyJson(data[0]));
     // print("here is what you want: ${newsList[0].description.toString()}");
     // //var dat=jsonDecode(data);
       // print(data);
     //print(map['results'][0]["creator"][0]);
     return response;
   }
}