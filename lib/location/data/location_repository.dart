import 'package:dio/dio.dart';
import 'package:showbook/location/data/location_model.dart';

class LocationRepository {
  final Dio dio;

  LocationRepository({required this.dio});
  Future<List<LocationModel>> getLocation() async {
    Response response = await dio.get('/api/showbook/location');

    var data = response.data['locations'];

    List<LocationModel> locations = [];
    for (var location in data) {
      locations.add(LocationModel.fromJson(location));
    }
    return locations;
  }
}
