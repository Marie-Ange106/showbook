// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:showbook/application_screen.dart' as _i1;
import 'package:showbook/auth/presentation/pages/forgot_pwd_screen.dart' as _i2;
import 'package:showbook/auth/presentation/pages/login_screen.dart' as _i3;
import 'package:showbook/auth/presentation/pages/resetpwd_screen.dart' as _i4;
import 'package:showbook/auth/presentation/pages/signup_screen.dart' as _i5;
import 'package:showbook/home/data/models/event_model.dart' as _i21;
import 'package:showbook/home/data/models/profil_model.dart' as _i22;
import 'package:showbook/home/presentation/pages/categories_list_screen.dart'
    as _i18;
import 'package:showbook/home/presentation/pages/coming_event_profil.dart'
    as _i12;
import 'package:showbook/home/presentation/pages/detail_event_screen.dart'
    as _i6;
import 'package:showbook/home/presentation/pages/detail_profil_screen.dart'
    as _i7;
import 'package:showbook/home/presentation/pages/for_you_screen.dart' as _i8;
import 'package:showbook/home/presentation/pages/home_screen.dart' as _i9;
import 'package:showbook/home/presentation/pages/past_event_profil_screen.dart'
    as _i13;
import 'package:showbook/shared/widgets/vertical_menu.dart' as _i17;
import 'package:showbook/account/pages/my_account_screen.dart' as _i10;
import 'package:showbook/user_event/my_event.dart' as _i11;
import 'package:showbook/search/presentation/pages/event_list_screen.dart'
    as _i14;
import 'package:showbook/search/presentation/pages/profil_list_screen.dart'
    as _i15;
import 'package:showbook/search/presentation/pages/search_screen.dart' as _i16;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    ApplicationRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ApplicationScreen(),
      );
    },
    ForgotPwdRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ForgotPwdScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    ResetPwdRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ResetPwdScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignupScreen(),
      );
    },
    DetailEventRoute.name: (routeData) {
      final args = routeData.argsAs<DetailEventRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DetailEventScreen(
          key: args.key,
          event: args.event,
        ),
      );
    },
    DetailProfilRoute.name: (routeData) {
      final args = routeData.argsAs<DetailProfilRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DetailProfilScreen(
          key: args.key,
          profil: args.profil,
        ),
      );
    },
    ForYouRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ForYouScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomeScreen(),
      );
    },
    MyAccountRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MyAccountScreen(),
      );
    },
    MyEventRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MyEventScreen(),
      );
    },
    Coming.name: (routeData) {
      final args = routeData.argsAs<ComingArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.Coming(
          key: args.key,
          profilModel: args.profilModel,
        ),
      );
    },
    PastEventProfilRoute.name: (routeData) {
      final args = routeData.argsAs<PastEventProfilRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.PastEventProfilScreen(
          key: args.key,
          profilModel: args.profilModel,
        ),
      );
    },
    EventListRoute.name: (routeData) {
      final args = routeData.argsAs<EventListRouteArgs>(
          orElse: () => const EventListRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.EventListScreen(key: args.key),
      );
    },
    ProfilListRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ProfilListScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SearchScreen(),
      );
    },
    VerticalMenuRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.VerticalMenuScreen(),
      );
    },
    CategoryListRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.CategoryListScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ApplicationScreen]
class ApplicationRoute extends _i19.PageRouteInfo<void> {
  const ApplicationRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ApplicationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplicationRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ForgotPwdScreen]
class ForgotPwdRoute extends _i19.PageRouteInfo<void> {
  const ForgotPwdRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ForgotPwdRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPwdRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute({List<_i19.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ResetPwdScreen]
class ResetPwdRoute extends _i19.PageRouteInfo<void> {
  const ResetPwdRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ResetPwdRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPwdRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignupScreen]
class SignupRoute extends _i19.PageRouteInfo<void> {
  const SignupRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DetailEventScreen]
class DetailEventRoute extends _i19.PageRouteInfo<DetailEventRouteArgs> {
  DetailEventRoute({
    _i20.Key? key,
    required _i21.EventModel event,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          DetailEventRoute.name,
          args: DetailEventRouteArgs(
            key: key,
            event: event,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailEventRoute';

  static const _i19.PageInfo<DetailEventRouteArgs> page =
      _i19.PageInfo<DetailEventRouteArgs>(name);
}

class DetailEventRouteArgs {
  const DetailEventRouteArgs({
    this.key,
    required this.event,
  });

  final _i20.Key? key;

  final _i21.EventModel event;

  @override
  String toString() {
    return 'DetailEventRouteArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [_i7.DetailProfilScreen]
class DetailProfilRoute extends _i19.PageRouteInfo<DetailProfilRouteArgs> {
  DetailProfilRoute({
    _i20.Key? key,
    required _i22.ProfilModel profil,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          DetailProfilRoute.name,
          args: DetailProfilRouteArgs(
            key: key,
            profil: profil,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailProfilRoute';

  static const _i19.PageInfo<DetailProfilRouteArgs> page =
      _i19.PageInfo<DetailProfilRouteArgs>(name);
}

class DetailProfilRouteArgs {
  const DetailProfilRouteArgs({
    this.key,
    required this.profil,
  });

  final _i20.Key? key;

  final _i22.ProfilModel profil;

  @override
  String toString() {
    return 'DetailProfilRouteArgs{key: $key, profil: $profil}';
  }
}

/// generated route for
/// [_i8.ForYouScreen]
class ForYouRoute extends _i19.PageRouteInfo<void> {
  const ForYouRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ForYouRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForYouRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomeScreen]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute({List<_i19.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MyAccountScreen]
class MyAccountRoute extends _i19.PageRouteInfo<void> {
  const MyAccountRoute({List<_i19.PageRouteInfo>? children})
      : super(
          MyAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAccountRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MyEventScreen]
class MyEventRoute extends _i19.PageRouteInfo<void> {
  const MyEventRoute({List<_i19.PageRouteInfo>? children})
      : super(
          MyEventRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyEventRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i12.Coming]
class Coming extends _i19.PageRouteInfo<ComingArgs> {
  Coming({
    _i20.Key? key,
    required _i22.ProfilModel profilModel,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          Coming.name,
          args: ComingArgs(
            key: key,
            profilModel: profilModel,
          ),
          initialChildren: children,
        );

  static const String name = 'Coming';

  static const _i19.PageInfo<ComingArgs> page = _i19.PageInfo<ComingArgs>(name);
}

class ComingArgs {
  const ComingArgs({
    this.key,
    required this.profilModel,
  });

  final _i20.Key? key;

  final _i22.ProfilModel profilModel;

  @override
  String toString() {
    return 'ComingArgs{key: $key, profilModel: $profilModel}';
  }
}

/// generated route for
/// [_i13.PastEventProfilScreen]
class PastEventProfilRoute
    extends _i19.PageRouteInfo<PastEventProfilRouteArgs> {
  PastEventProfilRoute({
    _i20.Key? key,
    required _i22.ProfilModel profilModel,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          PastEventProfilRoute.name,
          args: PastEventProfilRouteArgs(
            key: key,
            profilModel: profilModel,
          ),
          initialChildren: children,
        );

  static const String name = 'PastEventProfilRoute';

  static const _i19.PageInfo<PastEventProfilRouteArgs> page =
      _i19.PageInfo<PastEventProfilRouteArgs>(name);
}

class PastEventProfilRouteArgs {
  const PastEventProfilRouteArgs({
    this.key,
    required this.profilModel,
  });

  final _i20.Key? key;

  final _i22.ProfilModel profilModel;

  @override
  String toString() {
    return 'PastEventProfilRouteArgs{key: $key, profilModel: $profilModel}';
  }
}

/// generated route for
/// [_i14.EventListScreen]
class EventListRoute extends _i19.PageRouteInfo<EventListRouteArgs> {
  EventListRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          EventListRoute.name,
          args: EventListRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EventListRoute';

  static const _i19.PageInfo<EventListRouteArgs> page =
      _i19.PageInfo<EventListRouteArgs>(name);
}

class EventListRouteArgs {
  const EventListRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'EventListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.ProfilListScreen]
class ProfilListRoute extends _i19.PageRouteInfo<void> {
  const ProfilListRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ProfilListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilListRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SearchScreen]
class SearchRoute extends _i19.PageRouteInfo<void> {
  const SearchRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i17.VerticalMenuScreen]
class VerticalMenuRoute extends _i19.PageRouteInfo<void> {
  const VerticalMenuRoute({List<_i19.PageRouteInfo>? children})
      : super(
          VerticalMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerticalMenuRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.CategoryListScreen]
class CategoryListRoute extends _i19.PageRouteInfo<void> {
  const CategoryListRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CategoryListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryListRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}
