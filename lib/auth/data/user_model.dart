

class UserModel {
  int id;
  String name;
  String email;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  // List<LikeModel>? likes;

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    // this.likes,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      // likes: json['likes'] != null
      //     ? (json['likes'] as List<dynamic>)
      //         .map((e) => LikeModel.fromJson(e))
      //         .toList()
      //     : [],
    );
  }

  // bool isLikeBy({required int userId}) {
  //   for (var like in likes!) {
  //     if (like.userId == userId) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  // void removeLike({required int eventId, required int uId}) {
  //   for (var ele in likes!) {
  //     if (ele.eventId == eventId && ele.userId == uId) {
  //       likes!.remove(ele);
  //       break;
  //     }
  //   }
  // }

  // void addLike({required UserModel user, required EventModel event}) {
  //   likes!.add(
  //     LikeModel(
  //       userId: user.id,
  //       eventId: event.id,
  //     ),
  //   );
  //   // print(followers);
  // }
  
}
