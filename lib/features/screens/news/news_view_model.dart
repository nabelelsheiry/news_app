import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/repository/news_repository.dart';
import 'package:news/model/sources_response.dart';
class NewsState{
  List<SourceDm> source ;
  bool isLoading ;
  String errorMsg;
  NewsState({ this.source = const [], this.isLoading= false, this.errorMsg = ""});
}
class NewsViewModel extends Cubit<NewsState>{
  NewsRepository newsRepository = NewsRepository();
  NewsViewModel(): super(NewsState());

 void loadSources(String category)async{
       try{
         emit(NewsState(isLoading: true));
         var sources = await newsRepository.loadSources(category);
         emit(NewsState(source: sources));
       } catch(e){
        emit(NewsState(errorMsg: e.toString()));
       }
  }
}