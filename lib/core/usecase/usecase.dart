import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sample/core/error/failure.dart';


abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
