// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:showbook/auth/presentation/forgot_pwd_screen.dart' as _i1;
import 'package:showbook/auth/presentation/login_screen.dart' as _i2;
import 'package:showbook/auth/presentation/resetpwd_screen.dart' as _i3;
import 'package:showbook/auth/presentation/signup_screen.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ForgotPwdRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ForgotPwdScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    ResetPwdRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ResetPwdScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignupScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ForgotPwdScreen]
class ForgotPwdRoute extends _i5.PageRouteInfo<void> {
  const ForgotPwdRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ForgotPwdRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPwdRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ResetPwdScreen]
class ResetPwdRoute extends _i5.PageRouteInfo<void> {
  const ResetPwdRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ResetPwdRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPwdRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignupScreen]
class SignupRoute extends _i5.PageRouteInfo<void> {
  const SignupRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
