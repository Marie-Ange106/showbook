part of 'user_cubit.dart';

class UserState {
  // state follow
  List<ProfilModel> profilFollow;
  int total;
  // state update name and email
  UserModel? user;
  String? message;

  bool isSavingNameEmailModification;
  bool successSavingNameEmailModification;
  bool errorSavingNameEmailModification;

  // state update password
  bool isSavingPwdModification;
  bool successSavingPwdModification;
  bool errorSavingPwdModification;

  // state delete account
  String? result;
  bool isDeletingAccount;
  bool sucessDeletingAccount;
  bool errorDeletingAccount;

  UserState({
    // state follow
    required this.profilFollow,
    required this.total,

    // state update name and email
    this.user,
    this.message,
    this.isSavingNameEmailModification = false,
    this.successSavingNameEmailModification = false,
    this.errorSavingNameEmailModification = false,

    // state update password
    this.isSavingPwdModification = false,
    this.successSavingPwdModification = false,
    this.errorSavingPwdModification = false,

    // state delete account
    this.result,
    this.isDeletingAccount = false,
    this.sucessDeletingAccount = false,
    this.errorDeletingAccount = false,
  });

  UserState copyWith({
    // state follow
    List<ProfilModel>? profilFollow,
    int? total,

    // state update name and email
    UserModel? user,
    String? message,
    bool? isSavingNameEmailModification,
    bool? successSavingNameEmailModification,
    bool? errorSavingNameEmailModification,

    // state update password
    bool? isSavingPwdModification,
    bool? successSavingPwdModification,
    bool? errorSavingPwdModification,

    // state delete account
    String? result,
    bool? isDeletingAccount,
    bool? sucessDeletingAccount,
    bool? errorDeletingAccount,
  }) {
    return UserState(
      // state follow
      profilFollow: profilFollow ?? this.profilFollow,
      total: total ?? this.total,

      // state update name and email
      user: user ?? this.user,
      message: message ?? this.message,
      isSavingNameEmailModification:
          isSavingNameEmailModification ?? this.isSavingNameEmailModification,
      successSavingNameEmailModification: successSavingNameEmailModification ??
          this.errorSavingNameEmailModification,
      errorSavingNameEmailModification: errorSavingNameEmailModification ??
          this.errorSavingNameEmailModification,

      // state update password
      isSavingPwdModification:
          isSavingPwdModification ?? this.errorSavingPwdModification,
      successSavingPwdModification:
          successSavingPwdModification ?? this.errorSavingPwdModification,
      errorSavingPwdModification:
          errorSavingPwdModification ?? this.errorSavingPwdModification,

      // state delete account
      result: result?? this.result,
      isDeletingAccount: isDeletingAccount ?? this.isDeletingAccount,
      sucessDeletingAccount:
          sucessDeletingAccount ?? this.sucessDeletingAccount,
      errorDeletingAccount: errorDeletingAccount ?? this.errorDeletingAccount,
    );
  }
}
