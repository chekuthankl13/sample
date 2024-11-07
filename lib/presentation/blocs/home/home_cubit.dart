import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample/core/usecase/usecase.dart';
import 'package:sample/domain/entity/home_entity.dart';
import 'package:sample/domain/usecases/home/fetch_product_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final FetchProductUsecase fetchProductUsecase;
  HomeCubit(this.fetchProductUsecase) : super(HomeInitial());

  fetch()async{
    emit(HomeLoading());
    var res = await fetchProductUsecase.call(NoParams());
    res.fold((l)=>emit(HomeLoadError(error: l.error)), (r)=>emit(HomeLoaded(products: r),),);
  }
}
