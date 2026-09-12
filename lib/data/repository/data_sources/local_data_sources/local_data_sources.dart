
import 'package:hive_flutter/adapters.dart';
import 'package:news/model/sources_response.dart';

class LocalDataSources {
   Future<List<SourceDm>> loadSources(String category)async{
     var box = await Hive.openBox("news");
     var sources = box.get(category) as List<SourceDm>;
     return sources?? [];
   }
   Future<void> savedSources(String category , List<SourceDm> sources)async{
     var box = await Hive.openBox("news");
     box.put(category, sources);
   }
}
class SourceDmAdapter extends TypeAdapter<SourceDm>{
  @override
  SourceDm read(BinaryReader reader) {
    // TODO: implement read
   return  SourceDm.fromJson(reader.read());

  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, SourceDm obj) {
    // TODO: implement write
    writer.write(obj.toJson());
  }
  
}
