part of 'auth_cubit.dart';

// @immutable
class AuthState {
  final UserModel? user;
  final bool isLoginging;
  final bool sucessLoginging;
  final bool errorLoginging;
  //
  final String? message;
  // 
  final bool isRegistering;
  final bool sucessRegistering;
  final bool errorRegistering;
  // 
  final bool sucessTcheckUser;
  final bool isCheckingUser;
  final bool errorTcheckUser;

  const AuthState({
    this.user,
    this.isLoginging = false,
    this.sucessLoginging = false,
    this.errorLoginging = false,
    // 
    this.message,
    // 
    this.isRegistering = false,
    this.errorRegistering = false,
    this.sucessRegistering = false,
    // 
    this.sucessTcheckUser = false,
    this.isCheckingUser = false,
    this.errorTcheckUser = false,
  });

  AuthState copyWith({
    UserModel? user,
    bool? isLoginging,
    bool? sucessLoginging,
    bool? errorLoginging,
    // 
    String? message,
    // register
    bool? isRegistering,
    bool? sucessRegistering,
    bool? errorRegistering,
    // check user
    bool? sucessTcheckUser,
    bool? isCheckingUser,
    bool? errorTcheckUser,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoginging: isLoginging ?? this.isLoginging,
      sucessLoginging: sucessLoginging ?? this.sucessLoginging,
      errorLoginging: errorLoginging ?? this.errorLoginging,
      // 
      message: message ?? this.message,
      // 
      isRegistering: isRegistering ?? this.isRegistering,
      sucessRegistering: sucessRegistering ?? this.sucessRegistering,
      errorRegistering: errorRegistering ?? this.errorRegistering,
      // 
      sucessTcheckUser: sucessTcheckUser ?? this.sucessTcheckUser,
      isCheckingUser: isCheckingUser ?? this.isCheckingUser,
      errorTcheckUser:  errorTcheckUser ?? this.errorTcheckUser,
    );
  }
}
