part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeShowSaldoState extends HomeState {
  final bool isShowSaldo;

  const HomeShowSaldoState({required this.isShowSaldo});

  @override
  List<Object> get props => [isShowSaldo];
}

class HomeInit extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final ListHomeModel listHomeModel;
  

  const HomeSuccessState({required this.listHomeModel});

  @override
  List<Object> get props => [listHomeModel];
}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
