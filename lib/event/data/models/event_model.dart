import 'package:showbook/category/data/models/category_model.dart';
import 'package:showbook/location/data/location_model.dart';
import 'package:showbook/profil/data/models/profil_model.dart';

class EventModel {
  int id;
  String title;
  String description;
  String pathImage;
  int numberSpace;
  DateTime startDate;
  DateTime? endDate;
  int organiserId;
  int userId;
  int locationId;
  String state;
  String createdAt;
  String updatedAt;
  List<CategoryModel> categories;
  LocationModel location;
  ProfilModel? organizer;
  List<ProfilModel>? guests;
  int? price;
  int featured;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.pathImage,
    required this.numberSpace,
    required this.startDate,
    this.endDate,
    required this.organiserId,
    required this.userId,
    required this.locationId,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    required this.categories,
    required this.location,
    this.organizer,
    this.guests,
    this.price,
    required this.featured,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      pathImage: json['path_image'],
      numberSpace: json['number_space'],
      startDate: DateTime.parse(json['start_date']),
      endDate:
          json['end_date'] != null ? DateTime.parse(json['end_date']) : null,
      // endDate: DateTime.parse(json['end_date']),
      organiserId: json['organizer_id'],
      userId: json['user_id'],
      locationId: json['location_id'],
      state: json['state'],
      price: json['price'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      categories: List<CategoryModel>.from(json['categories']
          .map((category) => CategoryModel.fromJson(category))),
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      organizer:
          ProfilModel.fromJson(json['organizer'] as Map<String, dynamic>),
      guests: List<ProfilModel>.from(
          json['guests'].map((guest) => ProfilModel.fromJson(guest))),
      featured: json['featured'],
    );
  }
}
