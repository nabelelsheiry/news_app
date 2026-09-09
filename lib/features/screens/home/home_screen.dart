import 'package:flutter/material.dart';
import 'package:news/core/utiles/app_assets.dart';

import 'package:news/core/widgets/drawer_widget.dart';
import 'package:news/features/screens/home/listview_widget.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/model/category_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<CategoryModel> categories=[
    CategoryModel(categoryName: "General", imageLight: AppAssets.listview1, imageDark: AppAssets.listviewDark1),
    CategoryModel(categoryName: "Business", imageLight: AppAssets.listview2, imageDark: AppAssets.listviewDark2),
    CategoryModel(categoryName: "Sports", imageLight: AppAssets.listview3, imageDark: AppAssets.listviewDark3),
    CategoryModel(categoryName: "Technology", imageLight: AppAssets.listview4, imageDark: AppAssets.listviewDark4),
    CategoryModel(categoryName: "Entertainment", imageLight: AppAssets.listview5, imageDark: AppAssets.listviewDark1),
    CategoryModel(categoryName: "Health", imageLight: AppAssets.listview6, imageDark: AppAssets.listviewDark2),
    CategoryModel(categoryName: "Science", imageLight: AppAssets.listview7, imageDark: AppAssets.listviewDark3),
  ];

  @override
  Widget build(BuildContext context) {
    var locale= AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      drawer: DrawerWidget(),
      appBar:AppBar(
        title: Text(locale.home),
        actions: [
          const Icon(Icons.search),
          const SizedBox(width: 16,)
        ],
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.only(top: 16,right: 16,left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(locale.goodMorning,style: theme.textTheme.bodySmall,),
              Text(locale.hereIsSomeNewsForYou ,style: theme.textTheme.bodySmall,),
            const SizedBox(height: 16,),
            Expanded(child: ListviewWidget(categories: categories,))
          ],
        ),
      )),
    );
  }
}
