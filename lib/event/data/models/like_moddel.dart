class LikeModel {
  int id;
  int? userId;
  int eventId;
  DateTime createdAt;
  DateTime updatedAt;

  LikeModel({
    required this.id,
     this.userId,
    required this.eventId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LikeModel.fromJson(Map<String, dynamic> json) {
    return LikeModel(
      id: json['id'],
      userId: json['userId'],
      eventId: json['eventId'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
