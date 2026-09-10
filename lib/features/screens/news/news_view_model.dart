import 'package:flutter/cupertino.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/model/sources_response.dart';

class NewsViewModel extends ChangeNotifier{
  List<SourceDm> source =[];
  bool isLoading = false;
  String errorMsg ="";
  loadSources(String category)async{
       try{
         isLoading = true;
         notifyListeners();
         source =  await ApiManager.loadSources(category);
         isLoading = false;
         notifyListeners();

       } catch(e){
        errorMsg = e.toString();
        notifyListeners();

       }
  }
}