import 'package:dartz/dartz.dart';
import 'package:sample/core/error/failure.dart';
import 'package:sample/data/data_source/remote/home_remote_data_source.dart';
import 'package:sample/data/models/home_model.dart';
import 'package:sample/domain/entity/home_entity.dart';
import 'package:sample/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remote;

  HomeRepositoryImpl({required this.remote});
  @override
  Future<Either<Failure, List<HomeEntity>>> fetchProducts()async {
    try {
      var res = await remote.fetchProduct();
      var k = res.map((i)=>HomeModel.froomEntity(i)).toList();
      return Right(k);
    } on Failure catch (e) {
      return Left(e);
    }
  }
  
}