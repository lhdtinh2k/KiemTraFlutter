

import 'package:flutter_news/models/categori_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> myCategories = <CategoryModel>[];
  CategoryModel categorieModel;

  //1
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Apple";
  categorieModel.imageUrl = "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_960_720.jpg";
  myCategories.add(categorieModel);

  //2
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Tesla";
  categorieModel.imageUrl = "https://cdn.pixabay.com/photo/2016/10/13/22/30/tesla-1738969_960_720.jpg";
  myCategories.add(categorieModel);

  //3
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Business";
  categorieModel.imageUrl = "https://cdn.pixabay.com/photo/2014/10/23/10/10/dollars-499481__340.jpg";
  myCategories.add(categorieModel);

  //4
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "TechCrunch";
  categorieModel.imageUrl = "https://cdn.pixabay.com/photo/2017/07/10/23/45/cubes-2492010_960_720.jpg";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Wall Street Journa";
  categorieModel.imageUrl = "https://cdn.pixabay.com/photo/2017/08/18/18/56/dices-over-newspaper-2656028_960_720.jpg";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Sports";
  categorieModel.imageUrl = "https://cdn.pixabay.com/photo/2015/03/01/22/27/women-655353_960_720.jpg";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Technology";
  categorieModel.imageUrl = "https://cdn.pixabay.com/photo/2020/03/09/15/59/scifi-4916165_960_720.jpg";
  myCategories.add(categorieModel);

  return myCategories;

}