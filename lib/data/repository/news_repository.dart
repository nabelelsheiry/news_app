
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news/data/repository/data_sources/local_data_sources/local_data_sources.dart';
import 'package:news/data/repository/data_sources/remote_data_sources/remote_data_sources.dart';
import 'package:news/model/sources_response.dart';

class NewsRepository {
final RemoteDataSources remoteDataSources = RemoteDataSources();
final LocalDataSources localDataSources = LocalDataSources();
  Future <List<SourceDm>>  loadSources(String category)async{
    final List<ConnectivityResult> connectivityResults = await (Connectivity().checkConnectivity());
    bool isOnline =connectivityResults.contains(ConnectivityResult.wifi) || connectivityResults.contains(ConnectivityResult.mobile);

   if(isOnline){
     var sources = await remoteDataSources.loadSources(category);
     localDataSources.savedSources(category, sources);
     return sources;
   }
   else{
     return  localDataSources.loadSources(category);
   }
}
}