import 'package:dio/dio.dart';
import 'package:news/model/articles_response.dart';
import 'package:news/model/sources_response.dart';

abstract final class ApiManager {
  static var _dio = Dio();
  static const String defMessage = "Something went wrong";
  static Future<List<SourceDm>> loadSources(String category)async{
    try{
      var serverResponse = await _dio.get("https://newsapi.org/v2/top-headlines/sources?apiKey=53e681415b874bf18f3ea578a181a0a0&category=$category");
      if(serverResponse.statusCode! >=200 && serverResponse.statusCode!<300){
        Map<String,dynamic> json = serverResponse.data!;
        var myResponse = SourceResponse.fromJson(json);
        return myResponse.sources!;
      }
      throw defMessage;
    }catch(e){
      rethrow;
    }
  }
  static Future<List<ArticleDm>> loadArticles(String sourceId)async{
    try{
      var serverResponse = await _dio.get(
        "https://newsapi.org/v2/everything",
        queryParameters: {
          'q': sourceId,
          'apiKey': '53e681415b874bf18f3ea578a181a0a0',
        },
      );
      if(serverResponse.statusCode! >=200 && serverResponse.statusCode!<300){
        Map<String,dynamic> json = serverResponse.data!;
        var myResponse = ArticleResponse.fromJson(json);
        return myResponse.articles!;
      }
      throw defMessage;
    }catch(e){
      rethrow;
    }
  }
  static Future<ArticleResponse> searchArticles(String searchQuery, int page) async {
    try {
      var serverResponse = await _dio.get(
        "https://newsapi.org/v2/everything",
        queryParameters: {
          'q': searchQuery,
          'apiKey': '53e681415b874bf18f3ea578a181a0a0',
          'page': page,
          'pageSize': 10,
        },
      );

      if (serverResponse.statusCode! >= 200 && serverResponse.statusCode! < 300) {
        Map<String, dynamic> json = serverResponse.data!;
        var myResponse = ArticleResponse.fromJson(json);
        return myResponse;
      }
      throw defMessage;
    } catch (e) {
      rethrow;
    }
  }}