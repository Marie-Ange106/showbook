import 'package:bloc/bloc.dart';
import '../../data/user_model.dart';
import '../../data/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({
    required this.authRepository,
  }) : super(const AuthState());

  login({
    required String email,
    required String password,
  }) async {
    try {
      emit( 
        state.copyWith(
          isLoginging: true,
          sucessLoginging: false,
          errorLoginging: false,
        ),
      );
      var user = await authRepository.login(
        email: email,
        password: password,
      );
      emit(
        state.copyWith(
          user: user,
          isLoginging: false,
          sucessLoginging: true,
          errorLoginging: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoginging: false,
          sucessLoginging: false,
          errorLoginging: true,
          message: e.toString(),
        ),
      );
    }
  }

  register({
    required name,
    required String email,
    required String password,
  }) async {
    try {
      emit(
        state.copyWith(
          isRegistering: true,
          sucessRegistering: false,
          errorRegistering: false,
        ),
      );
      var user = await authRepository.register(
        name: name,
        email: email,
        password: password,
      );
      emit(
        state.copyWith(
          user: user,
          isRegistering: false,
          sucessRegistering: true,
          errorRegistering: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isRegistering: false,
          sucessRegistering: false,
          errorRegistering: true,
          message: e.toString(),
        ),
      );
    }
  }

  getUser() async {
    try {
      emit(
        state.copyWith(
          failureTcheckUser: true,
          sucessTcheckUser: false,
          errorTcheckUser: true,
        ),
      );
      var user = await authRepository.getUser();
      emit(
        state.copyWith(
          user: user,
          sucessTcheckUser: true,
          failureTcheckUser: false,
          errorTcheckUser: true,
        ),
      );
      print(user);
    } catch (e) {
      emit(
        state.copyWith(
          sucessTcheckUser: false,
          failureTcheckUser: false,
          errorTcheckUser: true,
        ),
      );
      print(e.toString());
    }
  }
}
