

import 'package:dio/dio.dart';

import 'package:riverpod_json/models/users.dart';

class UserService {

static Future<List<UserDetail>> getUsers() async {
  final dio = Dio();

  try{
    final response = await dio.get('https://jsonplaceholder.typicode.com/users');
    final data = (response.data as List).map((e) => UserDetail.fromJson(e)).toList();
    return data;

  }

  on DioError catch(err){
    print(err.error);
    throw Exception('${err.error}');
  }

}


}




