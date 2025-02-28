import 'package:dio/dio.dart';
import 'package:riverpoddemo/src/data/models/photo.dart';

import '../data/models/user.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<List<User>> fetchUsers() async {
    try {
      final response =
          await _dio.get("https://jsonplaceholder.typicode.com/users");
      List data = response.data as List;
      List<User> users = data.map((e) => User.fromJson(e)).toList();
      return users;
    } catch (e) {
      throw Exception("Something went wrong $e");
    }
  }

  Future<List<Photo>> fetchPhotos() async {
    try {
      final response = await _dio.get("https://picsum.photos/v2/list");
      List data = response.data as List;
      print("DATA $data");
      return data.map((e) => Photo.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}
