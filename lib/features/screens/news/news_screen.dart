import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/core/utiles/app_colors.dart';
import 'package:news/core/utiles/app_router.dart';
import 'package:news/core/widgets/drawer_widget.dart';
import 'package:news/features/screens/news/articles_list.dart';
import 'package:news/features/screens/news/news_view_model.dart';
import 'package:news/model/category_model.dart';
import 'package:news/model/sources_response.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  final CategoryModel categoryModel;
  const NewsScreen({super.key, required this.categoryModel});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsViewModel viewModel = NewsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    viewModel.loadSources(widget.categoryModel.categoryName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget body;
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create:  (context) => viewModel ,
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text(widget.categoryModel.categoryName),

          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, AppRouter.search());
            }, icon: const Icon(Icons.search))
          ],
        ),
        body: Consumer<NewsViewModel>(builder: (context, vm, child) {
          if(viewModel.isLoading){
            body = Center(child:  CircularProgressIndicator(
              color: theme.primaryColor,
            ),);
          }
          else if (viewModel.errorMsg.isNotEmpty){
            body= Center(child: Text(viewModel.errorMsg),);
          }
          else{
            body = buildTabbar(viewModel.source);
          }
          return body;


        } ,),
      ),
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
