import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_connected_nodejs/data/repo/all_users_repo.dart';
import 'package:flutter_connected_nodejs/ui/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All users!"),
      ),
      body: BlocProvider(
        create: (BuildContext context) {
          final bloc = HomeBloc(allUsersRepository);
          bloc.add(HomeStarted());
          return bloc;
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeFailed) {
              return const Center(
                child: Text("we have problems"),
              );
            } else if (state is HomeSucess) {
              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: ((context, index) {
                      return Text(state.data[index].username);
                    })),
              );
            } else {
              throw "Bad state !";
            }
          },
        ),
      ),
    );
  }
}
