  import 'package:cached_network_image/cached_network_image.dart';
  import 'package:flutter/material.dart';
  import 'package:news/core/utiles/app_assets.dart';
  import 'package:news/core/utiles/app_colors.dart';
  import 'package:news/model/articles_response.dart';
  import 'package:url_launcher/url_launcher.dart';
  import 'package:timeago/timeago.dart' as timeago;
  class ArticleWidget extends StatelessWidget {
    final ArticleDm article;
    const ArticleWidget({super.key, required this.article});

    @override
    Widget build(BuildContext context) {
      var theme = Theme.of(context);
      var time = DateTime.parse(article.publishedAt!);
      return Container(

        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: theme.primaryColor,
            width: 1
          ),
        ),
        child:  InkWell(
          onTap: (){
            buildBottomModalSheet(context, article);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(16),child: CachedNetworkImage(imageUrl: "${article.urlToImage ??""}",
                    height: 200,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: AppColors.white,),),
              errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
          ),),),
                Text(article.title??"No articleTitle",style: theme.textTheme.titleSmall,maxLines: 2,overflow: TextOverflow.ellipsis,),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(child: Text("By: ${article.author?? "NO Author"}" ,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                    Text(timeago.format(time))
                  ],
                )

              ],
            ),
          ),
        ),
      ) ;
    }
    Future<dynamic> buildBottomModalSheet( BuildContext context,ArticleDm article) {
      var theme = Theme.of(context);
      return showModalBottomSheet(backgroundColor: theme.primaryColor,context: context, builder: (context) {
        final bool hasValidUrl = article.urlToImage != null && article.urlToImage!.trim().isNotEmpty;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child:  hasValidUrl
                    ? CachedNetworkImage(
                  imageUrl: article.urlToImage!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(color: AppColors.white),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    AppAssets.newsPlaceHolder,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
                    : Image.asset(
                  AppAssets.newsPlaceHolder,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Text("${article.title}",style: theme.textTheme.labelSmall,maxLines: 5,overflow: TextOverflow.ellipsis,),
              InkWell(
                onTap: (){
                  _openUrl("${article.url}");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text("View Full Article",style: theme.textTheme.labelMedium,),),
                  ),
                ),
              )

            ],
          ),
        );
      },);
    }
    Future<void> _openUrl(String urlString) async {
      final Uri url = Uri.parse(urlString);
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.inAppWebView,
        );
      } else {

      }
    }
  }
