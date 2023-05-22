import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/home/list_home_model.dart';
import '../../repositories/home/home_repostiroy.dart';

part 'home_data_event.dart';
part 'home_data_state.dart';

class HomeDataBloc extends Bloc<HomeDataEvent, HomeDataState> {
  final HomeRepository _homeRepository;
  HomeDataBloc(this._homeRepository) : super(HomeDataInitial()) {
    on<GetProductHomeEvent>((event, emit) async {
      emit(HomeDataLoadingState());
      try {
        ListHomeModel listHomeModel = await _homeRepository.getListHome();
        emit(HomeDataSuccessState(listHomeModel: listHomeModel));
      } catch (e) {
        emit(HomeDataErrorState(message: e.toString()));
      }
    });
  }
}
