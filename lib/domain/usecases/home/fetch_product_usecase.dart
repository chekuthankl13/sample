import 'package:dartz/dartz.dart';
import 'package:sample/core/error/failure.dart';
import 'package:sample/core/usecase/usecase.dart';
import 'package:sample/domain/entity/home_entity.dart';
import 'package:sample/domain/repository/home_repository.dart';

class FetchProductUsecase implements Usecase<List<HomeEntity>,NoParams> {
  final HomeRepository repo;

  FetchProductUsecase({required this.repo});
  @override
  Future<Either<Failure, List<HomeEntity>>> call(NoParams param)async {
    return await repo.fetchProducts();
  }
  
}