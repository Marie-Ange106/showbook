import 'package:dio/dio.dart';
import 'package:showbook/event/data/models/event_model.dart';

class EventRepository {
  final Dio dio;

  EventRepository({required this.dio});

  Future<List<EventModel>> getEvent({
    String? category,
    String? date,
    String? location,
    String? keyword,
    int? price,
  }) async {
    Map<String, dynamic> queryParameters = {};
    queryParameters['category'] = category;
    queryParameters['date'] = date;
    queryParameters['location'] = location;
    queryParameters['keyword'] = keyword;
    queryParameters['price'] = price;

    Response response = await dio.get(
      '/api/showbook/event',
      queryParameters: queryParameters,
    );

    var data = response.data["events"];
    // print(data);
    List<EventModel> events = [];
    for (var event in data) {
      events.add(EventModel.fromJson(event));
    }
    return events;
  }
}
