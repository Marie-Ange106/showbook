import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/data/user_model.dart';

class UserRepository {
  final Dio dio;

  UserRepository({required this.dio});

  Future updateNameAndEmail({
    required String email,
    required String name,
    required int userId,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Response response = await dio.put(
      '/api/showbook/user/$userId',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
      data: {
        'name': name,
        'email': email,
      },
    );
    var data = response.data;

    return UserModel.fromJson(data['user']);
  }

  Future updatePassword({
    required String oldPassword,
    required String password,
    required int userId,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    Response response = await dio.put(
      '/api/showbook/user/$userId/pwd',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
      data: {
        'old_password': oldPassword,
        'password': password,
      },
    );
    var data = response.data;

    if (data['message'] == 'Old password is incorrect') {
      return data['message'];
    }

    return UserModel.fromJson(data['user']);
  }

  Future deleteUser({
    required String password,
    required int userId,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    Response response = await dio.delete(
      '/api/showbook/user/$userId',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
      data: {
        'password': password,
      },
    );
    var data = response.data;

    return data['delete'];
  }
}
