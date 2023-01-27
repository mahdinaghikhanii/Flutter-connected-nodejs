import 'dart:convert';

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
    final respone = await httpclient.get('/api/users');

    validateResponse(respone);
    var decoded = json.decode(respone.data);

    var dataUsers = <AllUsersEntity>[];
    for (var data in (decoded as List)) {
      dataUsers.add(AllUsersEntity.fromJson(data));
    }
    return dataUsers;
  }
}
