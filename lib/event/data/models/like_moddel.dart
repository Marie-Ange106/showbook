class LikeModel {
  int userId;
  int eventId;

  LikeModel({
    required this.userId,
    required this.eventId,
  });

  factory LikeModel.fromJson(Map<String, dynamic> json) {
    return LikeModel(
      userId: json['userId'],
      eventId: json['eventId'],
    );
  }
}
