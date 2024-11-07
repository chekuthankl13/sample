import 'package:dartz/dartz.dart';
import 'package:sample/core/error/failure.dart';
import 'package:sample/domain/entity/home_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeEntity>>>  fetchProducts();
}