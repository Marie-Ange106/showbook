import 'package:bloc/bloc.dart';
import 'package:showbook/profil/data/models/profil_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit()
      : super(
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
}
