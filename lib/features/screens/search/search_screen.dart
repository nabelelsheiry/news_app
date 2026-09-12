import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/core/utiles/app_assets.dart';
import 'package:news/core/widgets/article_widget.dart';
import 'package:news/model/articles_response.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  List<ArticleDm> articles = [];
  String? errorMsg;
  bool isLoading = false;
  bool isLoadingMore = false;
  int currentPage = 1;
  int maxResult = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

  void onScroll() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200) {
      if (!isLoadingMore && !isLoading && articles.length < maxResult) {
        loadMoreArticles();
      }
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _search() async {
    if (searchController.text.trim().isEmpty) return;

    setState(() {
      isLoading = true;
      errorMsg = null;
      articles = [];
      currentPage = 1;
    });

    try {
      var response = await ApiManager.searchArticles(searchController.text, currentPage);
      if (!mounted) return;

      setState(() {
        articles = List.from(response.articles ?? []);
        maxResult = response.totalResults ?? 0;
        currentPage++;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMsg = e.toString();
        isLoading = false;
      });
    }
  }

  void loadMoreArticles() async {
    setState(() {
      isLoadingMore = true;
    });

    try {
      var response = await ApiManager.searchArticles(searchController.text, currentPage);
      if (!mounted) return;

      setState(() {
        articles = [...articles, ...?response.articles];
        currentPage++;
        isLoadingMore = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            leading: const SizedBox.shrink(),
            leadingWidth: 0,
            title: TextFormField(
              controller: searchController,
              onFieldSubmitted: (value) => _search(),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: theme.textTheme.bodySmall,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: theme.primaryColor, width: 1),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close, color: theme.primaryColor),
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      searchController.clear();
                    } else {
                      Navigator.pop(context);
                    }
                    setState(() {
                      articles = [];
                      errorMsg = null;
                    });
                  },
                ),
                prefixIcon: Icon(Icons.search, color: theme.primaryColor),
              ),
            ),
          ),

          if (isLoading)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),

          if (articles.isEmpty && errorMsg == null && !isLoading)
            SliverToBoxAdapter(
              child: Image.asset(AppAssets.emptyList),
            ),

          if (errorMsg != null && !isLoading)
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    errorMsg!,
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                ),
              ),
            ),

          if (articles.isNotEmpty)
            SliverList.separated(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8,left: 16,right: 16),
                  child: ArticleWidget(article: articles[index]),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20),
            ),

          if (isLoadingMore)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }
}