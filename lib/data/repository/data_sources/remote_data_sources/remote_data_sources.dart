import 'package:news/api/api_manager.dart';
import 'package:news/model/sources_response.dart';

class RemoteDataSources {
  Future <List<SourceDm>> loadSources(String category)async{
    return await ApiManager.loadSources(category);
  }
}