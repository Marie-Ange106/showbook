import 'package:showbook/home/data/models/event_model.dart';

class ProfilModel {
  int id;
  int typeId;
  String name;
  String biography;
  String imagePath;
  int phoneNumber;
  String email;
  String? instagram;
  String? facebook;
  String? twitter;
  int userId;
  String createdAt;
  String updatedAt;
  int? follower;
  List<EventModel>? eventsInvited;
  List<EventModel>? eventsOrganized;

  ProfilModel({
    required this.id,
    required this.typeId,
    required this.name,
    required this.biography,
    required this.imagePath,
    required this.phoneNumber,
    required this.email,
    this.instagram,
    this.facebook,
    this.twitter,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.follower,
    this.eventsInvited,
    this.eventsOrganized,
  });

  factory ProfilModel.fromJson(Map<String, dynamic> json) {
    return ProfilModel(
      id: json['id'],
      typeId: json['type_id'],
      name: json['name'],
      biography: json['biography'],
      imagePath: json['image_path'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      instagram: json['instagram'],
      facebook: json['facebook'],
      twitter: json['twitter'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      follower: json['users_count'],
      eventsInvited: json['events_invited'] != null
          ? List<EventModel>.from(
              json['events_invited'].map(
                (event) => EventModel.fromJson(event),
              ),
            )
          : null,
      eventsOrganized: json['events_organized'] != null
          ? List<EventModel>.from(
              json['events_organized'].map(
                (event) => EventModel.fromJson(event),
              ),
            )
          : null,
    );
  }
}
