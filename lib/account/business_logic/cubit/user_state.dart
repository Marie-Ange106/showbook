part of 'user_cubit.dart';

class UserState {
  List<ProfilModel> profilFollow;
  int total;
  UserState({
    required this.profilFollow,
    required this.total,
  });
  UserState copyWith({
    List<ProfilModel>? profilFollow,
    int? total,
  }) {
    return UserState(
      profilFollow: profilFollow ?? this.profilFollow,
      total: total ?? this.total,
    );
  }
}
