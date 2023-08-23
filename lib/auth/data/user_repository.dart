import 'package:dio/dio.dart';
import 'package:showbook/auth/data/user_model.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository({required this.dio});

  Future<UserModel> authenticate(String email, String password) async {
    Response response = await dio.post(
      '/api/showbook/user/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    // print(response.data);

    return response.data;
  }
}
