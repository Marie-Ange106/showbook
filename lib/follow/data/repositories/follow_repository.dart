import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../profil/data/models/profil_model.dart';

class FollowRepository {
  final Dio dio;

  FollowRepository({
    required this.dio,
  });

  Future<List<ProfilModel>?> fetchAuthUserFollowings() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    Response response = await dio.get(
      '/api/showbook/auth/followings',
      options: Options(
        headers: {
          'Authorization': "Bearer $token",
        },
      ),
    );

    var data = <ProfilModel>[];
    for (var profil in response.data) {
      data.add(ProfilModel.fromJson(profil));
    }

    return data;
  }
}
