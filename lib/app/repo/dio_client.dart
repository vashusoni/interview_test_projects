import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/user_model.dart';

class DioClient {
  final Dio _dio = Dio();
/// This is used to collect data from users in a list format....!**/

  String url = 'https://jsonplaceholder.typicode.com';
  String endPoint = '/users';

  List<UserLIstModel> userList = [];

  Future<List<UserLIstModel>> getUserData() async {
    Response response = await _dio.get(url + endPoint);
    try {
      var user = response.data;
      for (Map i in user) {
        userList.add(UserLIstModel.fromJson(i));
      }
    } catch (e) {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
    return userList;
  }
}
