part of 'profil_cubit.dart';

class ProfilState {
  List<ProfilModel>? profils;
  bool isLooadingProfil;
  bool sucessLoadingProfil;
  bool errorLoadingProfil;
  String? message;

  // * follow states
  FollowPivotModel? follow;
  bool isLoadingFollow;
  bool successLoadingFollow;
  bool errorLoadingFollow;

  ProfilState({
    this.profils,
    this.isLooadingProfil = false,
    this.sucessLoadingProfil = false,
    this.errorLoadingProfil = false,
    this.message,

    this.follow,
    this.isLoadingFollow = false,
    this.successLoadingFollow = false,
    this.errorLoadingFollow = false,
  });

  ProfilState copyWith({
    List<ProfilModel>? profils,
    bool? isLooadingProfil,
    bool? sucessLoadingProfil,
    bool? errorLoadingProfil,
    String? message,

    FollowPivotModel? follow,
    bool? isLoadingFollow,
    bool? successLoadingFollow,
    bool? errorLoadingFollow,
  }) {
    return ProfilState(
      profils: profils?? this.profils,
      isLooadingProfil: isLooadingProfil?? this.isLooadingProfil,
      sucessLoadingProfil: sucessLoadingProfil?? this.sucessLoadingProfil,
      errorLoadingProfil: errorLoadingProfil?? this.errorLoadingProfil,
      message: message?? this.message,

      follow: follow?? this.follow,
      isLoadingFollow: isLoadingFollow ?? this.isLoadingFollow,
      successLoadingFollow: successLoadingFollow ?? this.successLoadingFollow,
      errorLoadingFollow: errorLoadingFollow ?? this.errorLoadingFollow,
    );
  }
}
