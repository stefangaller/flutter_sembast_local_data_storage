import 'cake.dart';

abstract class CakeRepository {

  Future<int> insertCake(Cake cake);

  Future updateCake(Cake cake);

  Future deleteCake(int cakeId);

  Future<List<Cake>> getAllCakes();
}