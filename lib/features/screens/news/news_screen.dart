import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/utiles/app_router.dart';
import 'package:news/core/widgets/drawer_widget.dart';
import 'package:news/features/screens/news/articles_list.dart';
import 'package:news/features/screens/news/news_view_model.dart';
import 'package:news/model/category_model.dart';
import 'package:news/model/sources_response.dart';

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
    return BlocProvider(
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
        body: BlocBuilder<NewsViewModel, NewsState>(builder: (context, state) {
          if(state.isLoading){
            body = Center(child: CircularProgressIndicator(
              color: theme.primaryColor,
            ),);
          }
          else if (state.errorMsg.isNotEmpty){
            body= Center(child: Text(state.errorMsg),);
          }
          else{
            body = buildTabbar(state.source);
          }
          return body;


        } ,),
      ),
    );
  }

  Widget buildTabbar(List<SourceDm> sources){

    var tabs = sources.map((e)=> Text(e.name?? "Nothing")).toList();
    var articles = sources.map((e)=> ArticlesList(sourceId: e.id!)).toList();
    if(sources.isEmpty){
      return const Center(child: Text("No Sources"),);
    }
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
