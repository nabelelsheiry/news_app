import 'package:flutter/material.dart';
import 'package:news/features/screens/home/home_screen.dart';
import 'package:news/features/screens/news/news_screen.dart';
import 'package:news/features/screens/search/search_screen.dart';
import 'package:news/model/category_model.dart';

abstract final class AppRouter {
  static MaterialPageRoute home() =>
      MaterialPageRoute(builder: (_) => HomeScreen());

  static MaterialPageRoute news(CategoryModel category) =>
      MaterialPageRoute(builder: (_) => NewsScreen( categoryModel: category,));
  static MaterialPageRoute search() =>
      MaterialPageRoute(builder: (_) => SearchScreen());
}