

import 'package:get/get.dart';
import 'package:shopping/shopping/screens/NewsPage.dart';
import 'package:shopping/shopping/screens/Registration_page.dart';
import 'package:shopping/shopping/screens/dashboard.dart';
import 'package:shopping/shopping/screens/favouritenewspage.dart';
import 'package:shopping/shopping/screens/fullnewscreen.dart';
import 'package:shopping/shopping/screens/savedNews.dart';
import 'package:shopping/shopping/screens/wallet.dart';

import '../screens/ShoppingHomeScreen.dart';

class Routes{
  static String shipping='/';
  static String newsPage='/newsPage';
  static String dashBoard ='/dashboard';
  static String fullnewspage='/fullnewspage';
  static String favfullnewspage='/favfullnewspage';
  static String walletPage ="/walletPage";
  static String savedNews='/savedNews';
  static String RegScreen='/registrationScreen';

 static getFullnewspage(int indexId)=>"$fullnewspage?indexId=$indexId";
 static getfavFullnewspage(int indexI)=>"$favfullnewspage?indexI=$indexI";

  static List<GetPage> routes=[
    GetPage(name: shipping, page: ()=>ShoppingHomeScreen()),
    GetPage(name: newsPage, page:()=> NewsPage()),
    GetPage(name: dashBoard, page:()=>  DashBoard(),),
    GetPage(name: fullnewspage, page: (){
     var indexID=Get.parameters['indexId'];
    return  FullNews(int.parse(indexID!));
  },),
    GetPage(name: favfullnewspage, page: () {
      var indexI=Get.parameters['indexI'];
      return FavFullPage(int.parse(indexI!));
    }),
    GetPage(name: walletPage, page:()=> Wallet()),
    GetPage(name: savedNews, page:()=> SavedNews()),
    GetPage(name: RegScreen, page:()=>RegistrationPage()),

  ];

}