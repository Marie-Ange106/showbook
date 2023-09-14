import '../../../auth/data/user_model.dart';
import 'follow_pivot_model.dart';

class FollowerModel extends UserModel {
  FollowPivotModel pivot;

  FollowerModel({
    required this.pivot,
    required int id,
    required String name,
    required String email,
    DateTime? emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          email: email,
          id: id,
          name: name,
          emailVerifiedAt: emailVerifiedAt,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory FollowerModel.fromJson(Map<String, dynamic> json) => FollowerModel(
        pivot: FollowPivotModel.fromJson(json['pivot']),
        id: json['id'],
        name: json['name'],
        email: json['email'],
        emailVerifiedAt: json['email_verified_at'] != null
            ? DateTime.parse(json['email_verified_at'])
            : null,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
      );
}
