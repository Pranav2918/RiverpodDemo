import 'package:dio/dio.dart';

import '../data/models/user.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<List<User>> fetchUsers() async {
    try{
      final response = await _dio.get("https://jsonplaceholder.typicode.com/users");
      List data = response.data as List;
      List<User> users = data.map((e) => User.fromJson(e)).toList();
      return users;
    }catch (e){
      throw Exception("Something went wrong $e");
    }
  }
}