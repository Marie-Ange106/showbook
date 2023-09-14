import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showbook/event/data/models/event_model.dart';

import '../models/like_moddel.dart';

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

  Future<LikeModel> likedEvent({required int eventId}) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Response response = await dio.post(
      '/api/showbook/event/$eventId/like',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    var data = response.data["like"];
    // print(data);
    return LikeModel.fromJson(data);
  }

  // Future<List<LikeModel>> getAllEventLikedByUser(){
  //   List<LikeModel> likes = [];

  //     likes.add(LikeModel.fromJson(event));
  //   return likes;

  // }
  Future<EventModel> addEvent({
    required String title,
    required String description,
    required String pathImage,
    required int numberSpace,
    required String startDate,
    String? endDate,
    required int organiserId,
    required int userId,
    required int locationId,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Response response = await dio.post(
      '/api/showbook/event',
      data: {
        'title': title,
        'description': description,
        'path_image': pathImage,
        'number_space': numberSpace,
        'start_date': startDate,
        'end_date': endDate,
        'organiser_id': organiserId,
        'location_id': locationId,
      },
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    var data = response.data["event"];
    // print(data);

    return EventModel.fromJson(data);
  }
}
