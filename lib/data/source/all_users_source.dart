import 'package:dio/dio.dart';

import 'package:flutter_connected_nodejs/data/common/http_response_validator.dart';
import 'package:flutter_connected_nodejs/data/entity/allusers_entity.dart';

abstract class IAllUsersDataSource {
  Future<List<AllUsersEntity>> getAllUsers();
}

class AllUsersDataSource
    with HttpResponseValidator
    implements IAllUsersDataSource {
  final Dio httpclient;
  AllUsersDataSource(this.httpclient);
  @override
  Future<List<AllUsersEntity>> getAllUsers() async {
    final respone = await httpclient.get('api/users');

    validateResponse(respone);
    List<AllUsersEntity> listData = [];
    (respone.data as List).forEach((data) {
      listData.add(data);
    });
    return listData;
  }
}
