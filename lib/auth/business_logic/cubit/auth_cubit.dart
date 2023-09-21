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
          sucessTcheckUser: false,
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
          sucessTcheckUser: true,
          errorLoginging: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoginging: false,
          sucessLoginging: false,
          sucessTcheckUser: false,
          errorLoginging: true,
          message: 'Incorrect email or password',
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
          sucessTcheckUser: false,
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
          sucessTcheckUser: true,
          errorRegistering: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isRegistering: false,
          sucessRegistering: false,
          sucessTcheckUser: false,
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
          isCheckingUser: true,
          sucessTcheckUser: false,
          sucessLoginging: false,
          sucessRegistering: false,
          errorTcheckUser: false,
        ),
      );
      var user = await authRepository.getUser();
      emit(
        state.copyWith(
          user: user,
          sucessTcheckUser: true,
          sucessLoginging: true,
          sucessRegistering: true,
          isCheckingUser: false,
          errorTcheckUser: false,
        ),
      );
      // print(user);
    } catch (e) {
      emit(
        state.copyWith(
          sucessTcheckUser: false,
          isCheckingUser: false,
          sucessLoginging: false,
          sucessRegistering: false,
          errorTcheckUser: true,
        ),
      );
      print(e.toString());
    }
  }
}
