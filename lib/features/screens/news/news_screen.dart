import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/features/screens/news/articles_list.dart';
import 'package:news/model/sources_response.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("General"),
      ),
      body: FutureBuilder<List<SourceDm>>(future: ApiManager.loadSources(),
          builder: (context,snapshot){
            if(snapshot.hasError){
             return Center(child: Text(snapshot.error.toString()),);
            }
            else if(snapshot.hasData){
              var sources = snapshot.data!;
             return buildTabbar(sources);
            }
            else{
                return Center(child: CircularProgressIndicator(),);
            }
          }),
    );
  }
  Widget buildTabbar(List<SourceDm> sources){
    var tabs = sources.map((e)=> Text(e.name?? "Nothing")).toList();
    var articles = sources.map((e)=> ArticlesList(sourceId: e.id!)).toList();
    return DefaultTabController(
      
      length: sources.length,
      child: Column(
        children: [
          TabBar(tabs: tabs,isScrollable: true,tabAlignment: TabAlignment.start,
          ),
          Expanded(child: TabBarView(children: articles))
        ],
      ),
    );

  }
}
