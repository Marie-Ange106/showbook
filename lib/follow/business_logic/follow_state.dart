part of 'follow_cubit.dart';

class FollowState {
  List<ProfilModel>? followings;
  bool isLoadingFollowings;
  bool successLoadingFollowings;
  bool errorLoadingFollowings;
  String? message;

  List<UserModel>? followers;

  FollowState({
    this.followings,
    this.isLoadingFollowings = false,
    this.successLoadingFollowings = false,
    this.errorLoadingFollowings = false,
    this.message,
  });

  FollowState copyWith({
    List<ProfilModel>? followings,
    bool? isLoadingFollowings,
    bool? successLoadingFollowings,
    bool? errorLoadingFollowings,
    String? message,
  }) =>
      FollowState(
        followings: followings ?? this.followings,
        isLoadingFollowings: isLoadingFollowings ?? this.isLoadingFollowings,
        successLoadingFollowings:
            successLoadingFollowings ?? this.successLoadingFollowings,
        errorLoadingFollowings:
            errorLoadingFollowings ?? this.errorLoadingFollowings,
        message: message ?? this.message,
      );

  isPresentInFollowings({required int profilId}) {
    for (var following in followings!) {
      if (profilId == following.id) return true;
    }
    return false;
  }
}
