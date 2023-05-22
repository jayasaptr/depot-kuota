part of 'home_data_bloc.dart';

abstract class HomeDataEvent extends Equatable {
  const HomeDataEvent();

  @override
  List<Object> get props => [];
}

class GetProductHomeEvent extends HomeDataEvent {}

