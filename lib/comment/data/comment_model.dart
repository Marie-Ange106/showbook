import '../../auth/data/user_model.dart';

class CommentModel {
  int id;
  String content;
  int userId;
  int eventId;
  String? createdAt;
  String? updatedAt;
  UserModel user;

  CommentModel({
    required this.id,
    required this.content,
    required this.userId,
    required this.eventId,
    this.createdAt,
    this.updatedAt,
    required this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      content: json['content'],
      userId: json['user_id'],
      eventId: json['event_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
