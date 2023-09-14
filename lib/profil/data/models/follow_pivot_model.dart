class FollowPivotModel {
  final int profilId;
  final int userId;

  FollowPivotModel({
    required this.profilId,
    required this.userId,
  });

  factory FollowPivotModel.fromJson(Map<String, dynamic> json) =>
      FollowPivotModel(
        profilId: json['profil_id'],
        userId: json['user_id'],
      );
}
