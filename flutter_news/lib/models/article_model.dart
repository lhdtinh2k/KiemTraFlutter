class ArticleModel{
//  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String content;
  DateTime publishedAt;

    ArticleModel({required this.title, required this.url,
     required this.description, required this.content, required this.urlToImage, required this.publishedAt});
}