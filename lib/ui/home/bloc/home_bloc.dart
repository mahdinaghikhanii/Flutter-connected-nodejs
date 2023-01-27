import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_connected_nodejs/common/exception.dart';
import 'package:flutter_connected_nodejs/data/entity/allusers_entity.dart';
import 'package:flutter_connected_nodejs/data/repo/all_users_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  AllUsersRepository repository;
  HomeBloc(this.repository) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted) {
        try {
          emit(HomeLoading());

          final data = await repository.getAllUsers();
          emit(HomeSucess(data));
        } catch (e) {
          emit(HomeFailed(AppException()));
        }
      }
    });
  }
}
