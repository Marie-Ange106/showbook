import 'package:bloc/bloc.dart';

import '../../auth/data/user_model.dart';
import '../../profil/data/models/profil_model.dart';
import '../data/repositories/follow_repository.dart';

part 'follow_state.dart';

class FollowCubit extends Cubit<FollowState> {
  final FollowRepository followRepository;

  FollowCubit({
    required this.followRepository,
  }) : super(FollowState());

  fetchAuthUserFollowings() async {
    try {
      emit(
        state.copyWith(
          isLoadingFollowings: true,
          successLoadingFollowings: false,
          errorLoadingFollowings: false,
        ),
      );

      var data = await followRepository.fetchAuthUserFollowings();

      emit(
        state.copyWith(
          followings: data,
          isLoadingFollowings: false,
          successLoadingFollowings: true,
          errorLoadingFollowings: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoadingFollowings: false,
          successLoadingFollowings: false,
          errorLoadingFollowings: true,
          message: e.toString(),
        ),
      );
    }
  }
}
