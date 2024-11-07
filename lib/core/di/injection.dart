import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sample/data/data_source/remote/home_remote_data_source.dart';
import 'package:sample/data/repository/home_repository_impl.dart';
import 'package:sample/domain/repository/home_repository.dart';
import 'package:sample/domain/usecases/home/fetch_product_usecase.dart';
import 'package:sample/presentation/blocs/home/home_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependency()async{
  sl.registerLazySingleton(() => http.Client());

  //home 
  //bloc
  sl.registerFactory(()=>HomeCubit(sl()));
  //usecase
  sl.registerLazySingleton(()=>FetchProductUsecase(repo: sl()));
  //repository
  sl.registerLazySingleton<HomeRepository>(()=> HomeRepositoryImpl(remote: sl()));
  //remote
  sl.registerLazySingleton<HomeRemoteDataSource>(()=>HomeRemoteDataSourceImpl(client: sl()));
}