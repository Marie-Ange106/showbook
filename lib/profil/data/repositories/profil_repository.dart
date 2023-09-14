import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showbook/profil/data/models/profil_model.dart';

import '../models/follow_pivot_model.dart';

class ProfilRepository {
  final Dio dio;

  ProfilRepository({required this.dio});

  Future<List<ProfilModel>> getProfil({
    String? category,
    String? date,
    String? location,
    String? keyword,
    int? price,
    String? type,
  }) async {
    Map<String, dynamic> queryParameters = {};
    queryParameters['category'] = category;
    queryParameters['date'] = date;
    queryParameters['location'] = location;
    queryParameters['keyword'] = keyword;
    queryParameters['price'] = price;
    queryParameters['type'] = type;

    Response response = await dio.get(
      '/api/showbook/profil',
      queryParameters: queryParameters,
    );

    var data = response.data['profils'];
    List<ProfilModel> profils = [];

    for (var profil in data) {
      profils.add(ProfilModel.fromJson(profil));
    }
    return profils;
  }

  Future<FollowPivotModel?> follow({required int profilId}) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    Response response = await dio.post(
      '/api/showbook/profil/$profilId/follow',
      options: Options(
        headers: {
          'Authorization': "Bearer $token",
        },
      ),
    );

    if (response.data["message"] == "Unfollowed") {
      return null;
    }

    return FollowPivotModel.fromJson(response.data["follow"]);
  }
}
