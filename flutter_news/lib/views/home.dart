import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/models/categori_model.dart';
import 'package:flutter_news/views/article_view.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];

  bool _loading=true;

  @override
  void initState(){
    super.initState();
    categories = getCategories(); 
    getNews();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Text("Flutter"),
            const Text("News", style: TextStyle(
              color: Colors.amber,
            ),),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),      
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              //thanh luot
              Container(
                
                height: 70,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return CategoryTile(
                      imageUrl: categories[index].imageUrl,
                      CategoryName: categories[index].categoryName,
                    );
                  }),
              ),
              //Hien thi ds
              Container(
                padding: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return BlogTile(
                      imageUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      desc: articles[index].description,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, CategoryName;
  const CategoryTile({ Key? key, this.imageUrl, this.CategoryName }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl, width: 100,height: 50,fit: BoxFit.cover)
            ),
            Container(
              alignment: Alignment.center,
              width: 100, height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(CategoryName, style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  const BlogTile({ Key? key, required this.imageUrl, required this.title, required this.desc}) : super(key: key);
  final String imageUrl, title, desc;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArticleView(

          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(imageUrl)
            ),
            SizedBox(height: 5,),
            Text(title, style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),),
            SizedBox(height: 5,),
            Text(desc, style: TextStyle(
              color: Colors.grey
            ),),
          ],
        ),
      ),
    );
  }
}