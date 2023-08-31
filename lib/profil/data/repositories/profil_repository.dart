import 'package:dio/dio.dart';
import 'package:showbook/profil/data/models/profil_model.dart';

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
}
