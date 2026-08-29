import 'package:flutter/material.dart';
import 'package:news/core/utiles/app_assets.dart';
import 'package:news/core/utiles/app_colors.dart';
import 'package:news/model/articles_response.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleDm article;
  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context)!;
    return Container(
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.primaryColor,
          width: 1
        ),

      ),
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(16),child: Image.network(article.urlToImage??AppAssets.newsPlaceHolder,fit: BoxFit.cover)),
            Text(article.title??"No articleTitle",style: theme.textTheme.titleMedium,),
            Row(
              children: [
                Text("By: ${article.author?? "NO Author"}" ),
              ],
            )

          ],
        ),
      ),
    ) ;
  }
}
