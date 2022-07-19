import 'package:get/get.dart';
import 'package:shopping/shopping/helper/repositories/newsrepo.dart';
import 'package:shopping/shopping/models/newsModel.dart';
import 'package:shopping/utils/appDataBase.dart';

class NewsController extends GetxController {
  NewsRepo newsRepo;
  NewsController({required this.newsRepo});
  List<NewsModel> newsModalList = [];
  List savednews = [];

  Future<void> getNewsMainList() async {
    Response response = await newsRepo.getNewsList();
    newsModalList = [];
    try {
       newsModalList.addAll(NewsFile.fromJason(response.body).results!);
      update();
    } catch (e) {
      print("ok here is the probs in newscontroller: $e");
    }
  }

  Map<String, dynamic> getDataBase(int index) {
    return {
      "id": null,
      "title": newsModalList[index].title ??'a null',
      "creator": "google",
      "description": newsModalList[index].description??'a null',
      "content": newsModalList[index].content ??'a null',
      "pubDate": newsModalList[index].pubDate??'a null'.toString(),
      "source_id": newsModalList[index].source_id??'a null'.toString(),
      "image_url": newsModalList[index].image_url??'a null'.toString(),
    };
  }

  addToBase(int index) {
    AppDataBase base = AppDataBase.instance;
    base.create(index);
    print('hello here in newzController ${newsModalList[index].title}');
    update();
  }

  savedNews() async {
    final lizt = await AppDataBase.instance.readNote();
    savednews = [];
    for (var mp in lizt) {
      savednews.add(NewsModel.bloodyJson(mp));
    }
    print(savednews[1].title);
    update();
    return savednews;
  }
}
