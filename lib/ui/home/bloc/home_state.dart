part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeFailed extends HomeState {
  final AppException exception;

  @override
  List<Object> get props => [exception];

  const HomeFailed(this.exception);
}

class HomeSucess extends HomeState {
  final List<AllUsersEntity> data;
  const HomeSucess(this.data);
  @override
  List<Object> get props => [data];
}
