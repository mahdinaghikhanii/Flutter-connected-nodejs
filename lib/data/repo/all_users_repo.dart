import 'package:flutter_connected_nodejs/common/http_client.dart';
import 'package:flutter_connected_nodejs/data/entity/allusers_entity.dart';
import 'package:flutter_connected_nodejs/data/source/all_users_source.dart';

final allUsersRepository = AllUsersRepository(AllUsersDataSource(httpClint));

abstract class IAllUsersRepository {
  Future<List<AllUsersEntity>> getAllUsers();
}

class AllUsersRepository implements IAllUsersRepository {
  AllUsersDataSource dataSource;
  AllUsersRepository(this.dataSource);
  @override
  Future<List<AllUsersEntity>> getAllUsers() {
    return dataSource.getAllUsers();
  }
}
