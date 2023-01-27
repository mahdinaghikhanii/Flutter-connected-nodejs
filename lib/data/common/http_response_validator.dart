import 'package:dio/dio.dart';
import 'package:flutter_connected_nodejs/common/exception.dart';

mixin HttpResponseValidator {
  validateResponse(Response response) {
    if (response.statusCode != 200) {
      throw AppException();
    } else {
      return response;
    }
  }
}
