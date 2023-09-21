import 'package:bloc/bloc.dart';
import 'package:showbook/account/data/user_repository.dart';
import 'package:showbook/auth/data/user_model.dart';
import 'package:showbook/profil/data/models/profil_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  UserCubit({
    required this.userRepository,
  }) : super(
          UserState(
            profilFollow: [],
            total: 0,
          ),
        );

  getIndex(ProfilModel profil) {
    return state.profilFollow.indexWhere((item) => item.id == profil.id);
  }

  isFollow(ProfilModel profil) {
    return getIndex(profil) >= 0;
  }

  addProfilFollowed(ProfilModel profil) {
    List<ProfilModel> profils = [...state.profilFollow];

    profils.add(profil);
    emit(
      state.copyWith(
        profilFollow: profils,
        total: profils.length,
      ),
    );
  }

  removeProfil(ProfilModel profil) {
    List<ProfilModel> profils = [...state.profilFollow];
    profils.remove(profil);
    emit(
      state.copyWith(
        profilFollow: profils,
        total: profils.length,
      ),
    );
  }

  // update
  updateNameAndEmail({
    required String email,
    required String name,
    required int userId,
  }) async {
    try {
      emit(
        state.copyWith(
          isSavingNameEmailModification: true,
          successSavingNameEmailModification: false,
          errorSavingNameEmailModification: false,
        ),
      );
      var user = await userRepository.updateNameAndEmail(
        email: email,
        name: name,
        userId: userId,
      );
      emit(
        state.copyWith(
          user: user,
          isSavingNameEmailModification: false,
          successSavingNameEmailModification: true,
          errorSavingNameEmailModification: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isSavingNameEmailModification: false,
          successSavingNameEmailModification: false,
          errorSavingNameEmailModification: true,
          message: e.toString(),
        ),
      );
    }
  }

  updatePassword({
    required String oldPassword,
    required String password,
    required int userId,
  }) async {
    try {
      emit(
        state.copyWith(
          isSavingPwdModification: true,
          successSavingPwdModification: false,
          errorSavingPwdModification: false,
        ),
      );
      var user = await userRepository.updatePassword(
        oldPassword: oldPassword,
        password: password,
        userId: userId,
      );
      emit(
        state.copyWith(
          user: user,
          isSavingPwdModification: false,
          successSavingPwdModification: true,
          errorSavingPwdModification: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isSavingPwdModification: false,
          successSavingPwdModification: false,
          errorSavingPwdModification: true,
          message: e.toString(),
        ),
      );
    }
  }

  // Delete password

  deleteUser({
    required String password,
    required int userId,
  }) async {
    try {
      emit(
        state.copyWith(
          isDeletingAccount: true,
          sucessDeletingAccount: false,
          errorDeletingAccount: false,
        ),
      );
      var result = await userRepository.deleteUser(
        password: password,
        userId: userId,
      );
      emit(
        state.copyWith(
          result: result,
          isDeletingAccount: false,
          sucessDeletingAccount: true,
          errorDeletingAccount: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isDeletingAccount: false,
          sucessDeletingAccount: false,
          errorDeletingAccount: true,
          message: e.toString(),
        ),
      );
    }
  }
}
