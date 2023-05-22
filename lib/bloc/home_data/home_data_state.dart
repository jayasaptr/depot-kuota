part of 'home_data_bloc.dart';

abstract class HomeDataState extends Equatable {
  const HomeDataState();
  
  @override
  List<Object> get props => [];
}

class HomeDataInitial extends HomeDataState {}

class HomeDataLoadingState extends HomeDataState {}

class HomeDataSuccessState extends HomeDataState {
  final ListHomeModel listHomeModel;

  const HomeDataSuccessState({required this.listHomeModel});

  @override
  List<Object> get props => [listHomeModel];
}

class HomeDataErrorState extends HomeDataState {
  final String message;

  const HomeDataErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
