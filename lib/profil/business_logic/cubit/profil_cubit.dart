import 'package:bloc/bloc.dart';
import 'package:showbook/profil/data/models/profil_model.dart';
import 'package:showbook/profil/data/repositories/profil_repository.dart';

part 'profil_state.dart';

class ProfilCubit extends Cubit<ProfilState> {
  final ProfilRepository profilRepository;

  ProfilCubit({
    required this.profilRepository,
  }) : super(
          ProfilState(),
        );

  getProfil({
    String? category,
    String? date,
    String? location,
    String? keyword,
    int? price,
    String? type,
  }) async {
    try {
      emit(
        state.copyWith(
          isLooadingProfil: true,
          sucessLoadingProfil: false,
          errorLoadingProfil: false,
        ),
      );

      var profils = await profilRepository.getProfil(
        category: category,
        date: date,
        location: location,
        price: price,
        type: type,
        keyword: keyword,
      );
      emit(
        state.copyWith(
          profils: profils,
          isLooadingProfil: false,
          sucessLoadingProfil: true,
          errorLoadingProfil: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLooadingProfil: false,
          sucessLoadingProfil: false,
          errorLoadingProfil: true,
          message: e.toString(),
        ),
      );
    }
  }
}
