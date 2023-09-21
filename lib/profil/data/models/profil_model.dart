import 'package:showbook/event/data/models/event_model.dart';
import 'package:showbook/profil/data/models/type_profil_model.dart';

import '../../../auth/data/user_model.dart';
import 'follow_pivot_model.dart';
import 'follower_model.dart';

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
  TypeModel type;

  final List<FollowerModel?> followers;

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
    required this.followers,
    required this.type,
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
      followers: json['followers'] != null
          ? (json['followers'] as List<dynamic>)
              .map((e) => FollowerModel.fromJson(e))
              .toList()
          : [],
      type: TypeModel.fromJson(json['type'] as Map<String, dynamic>),
    );
  }

  bool isFollowBy({required int userId}) {
    for (var follower in followers) {
      if (follower!.pivot.userId == userId) {
        return true;
      }
    }
    return false;
  }

  void removeFollow({required int profilId, required int uId}) {
    for (var ele in followers) {
      if (ele!.pivot.profilId == profilId && ele.pivot.userId == uId) {
        followers.remove(ele);
        break;
      }
    }
  }

  void addFollow({required UserModel user}) {
    followers.add(
      FollowerModel(
        pivot: FollowPivotModel(profilId: id, userId: user.id),
        id: id,
        name: name,
        email: user.email,
        emailVerifiedAt: user.emailVerifiedAt,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt,
      ),
    );
    // print(followers);
  }
}
