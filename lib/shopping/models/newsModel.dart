
import 'dart:core';

class NewsFile{
  String? status;
  int? _totalResults;
  List<NewsModel>?results;
  int? _nextPage;
  NewsFile({status, totalResults, newsModel, nextPage,
  }){
    this._nextPage=nextPage;
    this.status=status;
    this.results=newsModel;
    this._totalResults=totalResults;
  }
  NewsFile.fromJason(Map<String,dynamic> json){
    status=json['status'];
    _totalResults=json["totalResults"];
    _nextPage=json["nextPage"];
    if(json["results"]!=null){
      results=<NewsModel>[];
      //print('result is not null woow');
      for(var result in json["results"]!){
        results?.add(NewsModel.bloodyJson(result));
       // print("ok here is results number: ${results?.length.toString()}");
      }
      //   json["results"].forEach((v){
      //     results?.add(NewsModel.bloodyJson(v));
      //   });
      // print("ok here is results number: ${results?.length.toString()}");
    }
  }



}

class NewsModel{
    int? id;
    String? title;
    List<String>? creator;
    String ? description;
    String? content;
    String? pubDate;
    String? source_id;
    String? image_url;

    NewsModel({this.id, this.content,this.creator,this.description,this.pubDate,this.source_id,this.title,this.image_url});

    NewsModel.bloodyJson(Map<String ,dynamic> json){
      id=null;
      title=json["title"];
      //creator=json['creator'][0];
      description=json["description"];
      content=json["content"];
      pubDate=json["pubDate"];
      source_id=json["source_id"];
      image_url=json['image_url'];

    }

    NewsModel copy({
      int? copyid,
      String? title,
      String? creator,
      String? description,
      String? content,
      String? pubDate,
      String? source_id,
      String? image_url ,
})=>NewsModel(
      id: copyid,
 title:this.title,
   creator: this.creator,
 description: this.description,
 content:this.content,
 pubDate:pubDate,
 source_id:this.source_id,
 image_url:this.image_url ,
    );

}


class DataNote{
  static String? id='id';
  static String? title='title';
  static String? creator='creator';
  static String? description='description';
  static String? content='content';
  static String? pubDate='pubDate';
  static String? source_id='source_id';
  static String? image_url='image_url';
  // DataNote({this.description,this.content,this.creator,this.title,this.image_url,this.pubDate,this.source_id});
}