import 'dart:io';

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
    int? today,
    int? thisWeek,
    int? thisWeekEnd,
    int? thisMonth,
    int? thisYear,
    int? paid,
    int? free,
  }) async {
    Map<String, dynamic> queryParameters = {};
    queryParameters['category'] = category;
    queryParameters['date'] = date;
    queryParameters['location'] = location;
    queryParameters['keyword'] = keyword;
    queryParameters['price'] = price;
    queryParameters['today'] = today;
    queryParameters['this_week'] = thisWeek;
    queryParameters['this_week_end'] = thisWeekEnd;
    queryParameters['this_year'] = thisYear;
    queryParameters['this_month'] = thisMonth;
    queryParameters['paid'] = paid;
    queryParameters['free'] = free;

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
    required File image,
    required int numberSpace,
    required DateTime startDate,
    String? endDate,
    int? price,
    required int organiserId,
    required int locationId,
    required int categories,
    int? guests,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // Convertir la File en MultipartFile
    final imageFile = await MultipartFile.fromFile(image.path);
    // Créer un objet FormData
  FormData formData = FormData.fromMap({
    'title': title,
    'description': description,
    'image': imageFile,
    'number_space': numberSpace,
    'start_date': startDate,
    // .toIso8601String()
    'end_date': endDate ?? '',
    'price': price ?? '',
    'organiser_id': organiserId,
    'location_id': locationId,
    'categories': categories,
    'guests': guests ?? '',
  });
    Response response = await dio.post(
      '/api/showbook/event',
      data: formData,
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    var data = response.data["event"];
    print(data);

    return EventModel.fromJson(data);
  }
}
