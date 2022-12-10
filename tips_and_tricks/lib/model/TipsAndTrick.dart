import 'dart:convert';

List<TipsAndTrick> tipsAndTrickFromJson(String str) => List<TipsAndTrick>.from(json.decode(str).map((x) => TipsAndTrick.fromJson(x)));

String tipsAndTrickToJson(List<TipsAndTrick> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TipsAndTrick{
  // int user = 0;
  String title = "";
  String source = "";
  String published_date = "";
  String brief_description = "";
  String image_url = "";
  String article_url = "";

  TipsAndTrick({
    // required this.user,
    required this.title,
    required this.source,
    required this.published_date,
    required this.brief_description,
    required this.image_url,
    required this.article_url,
  });

  factory TipsAndTrick.fromJson(Map<String, dynamic> json) => TipsAndTrick(
    // user: json["fields"]["user"], 
    title: json["fields"]["title"], 
    source: json["fields"]["source"], 
    published_date: json["fields"]["published_date"],
    brief_description: json["fields"]["brief_description"],
    image_url: json["fields"]["image_url"],
    article_url: json["fields"]["article_url"],
  );

  Map<String, dynamic> toJson() =>{
    // 'user': user,
    "title": title,
    "source": source,
    "published_date": published_date,
    "brief_description": brief_description,
    "image_url": image_url,
    "article_url": article_url,
  };
}