import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shopping/controllers/coin_controller.dart';
import 'package:shopping/controllers/newsController.dart';
import 'package:shopping/shopping/helper/Apiclient/coin_Apiclient.dart';
import 'package:shopping/shopping/helper/repositories/Coinrepo.dart';
import 'package:shopping/shopping/screens/ShoppingHomeScreen.dart';
import 'package:shopping/shopping/helper/repositories/newsrepo.dart';
import 'package:shopping/shopping/navigation/routes.dart';
import 'dependencies/dependencies.dart' as dpc;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dpc.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> NewsRepo(apiClient: Get.find()));
    Get.lazyPut(()=> CoinRepo(coinApiClient:Get.find()));
    //NewsRepo(apiClient: Get.find()).getNewsList();
    Get.find<NewsController>();
    Get.find<CoinController>();


    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home:  ShoppingHomeScreen(),
      initialRoute: Routes.shipping,
      getPages:Routes.routes ,
    );
  }
}
