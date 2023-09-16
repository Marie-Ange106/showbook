import 'package:dio/dio.dart';
import 'package:showbook/auth/data/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository({
    required this.dio,
  });

  // login****************************

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    Response response = await dio.post(
      '/api/showbook/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    var data = response.data;
    var token = data['token'];

    if (token != null) {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
    }

    return UserModel.fromJson(data['user']);
  }

  // register****************************

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    Response response = await dio.post(
      '/api/showbook/auth/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
    var data = response.data;
    var token = data['token'];

    if (token != null) {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
    }

    return UserModel.fromJson(data['user']);
  }

  //  logout user*********************

  Future<void> logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  // getUser***************************

  Future getUser() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // print(token);

    Response response = await dio.post(
      '/api/showbook/me',
      options: Options(
        headers: {
          'Authorization': "Bearer $token",
        },
      ),
    );
    // print(response.data);
    return UserModel.fromJson(response.data['user']);
  }
}
