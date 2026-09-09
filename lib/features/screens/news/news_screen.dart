import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/core/utiles/app_router.dart';
import 'package:news/core/widgets/drawer_widget.dart';
import 'package:news/features/screens/news/articles_list.dart';
import 'package:news/model/category_model.dart';
import 'package:news/model/sources_response.dart';

class NewsScreen extends StatelessWidget {
  final CategoryModel categoryModel;
  const NewsScreen({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(categoryModel.categoryName),

        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, AppRouter.search());
          }, icon: const Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<List<SourceDm>>(future: ApiManager.loadSources(categoryModel.categoryName),
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
