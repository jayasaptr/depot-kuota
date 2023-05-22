part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class HomeShowSaldoEvent extends HomeEvent {
  final bool isShowSaldo;

  const HomeShowSaldoEvent({required this.isShowSaldo});

  @override
  List<Object> get props => [isShowSaldo];
}

class GetListHomeEvent extends HomeEvent {}

