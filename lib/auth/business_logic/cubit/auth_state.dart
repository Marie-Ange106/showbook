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
  final bool failureTcheckUser;

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
    this.failureTcheckUser = false,
  });

  AuthState copyWith({
    UserModel? user,
    bool? isLoginging,
    bool? sucessLoginging,
    bool? errorLoginging,
    // 
    String? message,
    // 
    bool? isRegistering,
    bool? sucessRegistering,
    bool? errorRegistering,
    // 
    bool? sucessTcheckUser,
    bool? failureTcheckUser,
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
      failureTcheckUser: failureTcheckUser ?? this.failureTcheckUser,
    );
  }
}
