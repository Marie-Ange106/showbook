part of 'profil_cubit.dart';

class ProfilState {
  List<ProfilModel>? profils;
  bool isLooadingProfil;
  bool sucessLoadingProfil;
  bool errorLoadingProfil;
  String? message;

  ProfilState({
    this.profils,
    this.isLooadingProfil = false,
    this.sucessLoadingProfil = false,
    this.errorLoadingProfil = false,
    this.message,
  });

  ProfilState copyWith({
    List<ProfilModel>? profils,
    bool? isLooadingProfil,
    bool? sucessLoadingProfil,
    bool? errorLoadingProfil,
    String? message,
  }) {
    return ProfilState(
      profils: profils?? this.profils,
      isLooadingProfil: isLooadingProfil?? this.isLooadingProfil,
      sucessLoadingProfil: sucessLoadingProfil?? this.sucessLoadingProfil,
      errorLoadingProfil: errorLoadingProfil?? this.errorLoadingProfil,
      message: message?? this.message,
    );
  }
}
