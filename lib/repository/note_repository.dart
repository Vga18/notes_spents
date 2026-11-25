import '../model/note.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ActivesRepository {
  Future<List<ActivesModel>> fetchactive();
  Future<void> createactive(ActivesModel active);
  Future<void> updateactive(ActivesModel active);
  Future<void> deleteactive(String id);
}

class ActivesRepositoryImpl extends ActivesRepository{
  final _client = Supabase.instance.client;
  final String _tableName = 'actives';

  @override
  Future<List<ActivesModel>> fetchactive() async{
    // TODO: implement fetchNOtes
    final response = await _client.from(_tableName).select();
    return (response as List).map((json)=> ActivesModel.fromJson(json)).toList();
  }

  @override
  Future<void> createactive(ActivesModel active) async{
    // TODO: implement createactive
    await _client.from(_tableName).insert(active.toJson());
  }

  @override
  Future<void> deleteactive(String id) async{
    // TODO: implement deleteactive
    await _client.from(_tableName).delete().eq('id', id);
  }
  
  @override
  Future<void> updateactive(ActivesModel active) async{
    // TODO: implement updateactive
    await _client.from(_tableName).update(active.toJson()).eq('id', active.id!);
  }
  
}