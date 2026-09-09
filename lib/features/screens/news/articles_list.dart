import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/core/widgets/article_widget.dart';
import 'package:news/model/articles_response.dart';
import 'package:news/model/sources_response.dart';

class ArticlesList extends StatelessWidget {
  final String sourceId;
  const ArticlesList({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleDm>>(future: ApiManager.loadArticles(sourceId),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          else if(snapshot.hasData){
            var articles = snapshot.data!;
            return buildArticlesListView(articles);
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        });
  }

  Widget buildArticlesListView(List<ArticleDm> articles) {
    return ListView.builder(itemCount: articles.length  ,itemBuilder: (context,index)=> Padding(
      padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
      child: ArticleWidget(article: articles[index]),
    ));
  }
}
