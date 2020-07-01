import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_tutorial/cake.dart';
import 'package:sembast_tutorial/cake_repository.dart';

class SembastCakeRepository extends CakeRepository {
  final Database _database = GetIt.I.get();
  final StoreRef _store = intMapStoreFactory.store("cake_store");

  @override
  Future<int> insertCake(Cake cake) async {
    return await _store.add(_database, cake.toMap());
  }

  @override
  Future updateCake(Cake cake) async {
    await _store.record(cake.id).update(_database, cake.toMap());
  }

  @override
  Future deleteCake(int cakeId) async{
    await _store.record(cakeId).delete(_database);
  }

  @override
  Future<List<Cake>> getAllCakes() async {
    final snapshots = await _store.find(_database);
    return snapshots
        .map((snapshot) => Cake.fromMap(snapshot.key, snapshot.value))
        .toList(growable: false);
  }
}
