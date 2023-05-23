import 'package:bloc/bloc.dart';
import 'package:depotkuota/repositories/home/home_repostiroy.dart';
import 'package:equatable/equatable.dart';

import '../../model/home/list_home_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;
  HomeBloc(this._homeRepository) : super(HomeInitial()) {
    on<HomeShowSaldoEvent>((event, emit) {
      emit(HomeShowSaldoState(isShowSaldo: event.isShowSaldo));
    });
    on<GetListHomeEvent>((event, emit) async {
      emit(HomeLoadingDataState());
      try {
        ListHomeModel listHomeModel = await _homeRepository.getListHome();
        emit(HomeSuccessState(listHomeModel: listHomeModel));
      } catch (e) {
        emit(HomeErrorState(message: e.toString()));
      }
    });
  }
}
