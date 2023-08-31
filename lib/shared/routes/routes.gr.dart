// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i23;
import 'package:showbook/account/pages/followed_list_screen.dart' as _i1;
import 'package:showbook/account/pages/my_account_screen.dart' as _i2;
import 'package:showbook/account/pages/notification_list_screen.dart' as _i3;
import 'package:showbook/account/pages/ticket_list_screen.dart' as _i4;
import 'package:showbook/application_screen.dart' as _i5;
import 'package:showbook/auth/presentation/pages/forgot_pwd_screen.dart' as _i6;
import 'package:showbook/auth/presentation/pages/login_screen.dart' as _i7;
import 'package:showbook/auth/presentation/pages/resetpwd_screen.dart' as _i8;
import 'package:showbook/auth/presentation/pages/signup_screen.dart' as _i9;
import 'package:showbook/event/data/models/event_model.dart' as _i25;
import 'package:showbook/profil/data/models/profil_model.dart' as _i24;
import 'package:showbook/category/presentation/pages/categories_list_screen.dart'
    as _i10;
import 'package:showbook/event/presentation/pages/coming_event_profil.dart'
    as _i11;
import 'package:showbook/event/presentation/pages/detail_event_screen.dart'
    as _i12;
import 'package:showbook/profil/presentation/pages/detail_profil_screen.dart'
    as _i13;
import 'package:showbook/shared/pages/for_you_screen.dart' as _i14;
import 'package:showbook/shared/pages/home_screen.dart' as _i15;
import 'package:showbook/event/presentation/pages/past_event_profil_screen.dart'
    as _i16;
import 'package:showbook/search/presentation/pages/event_list_screen.dart'
    as _i17;
import 'package:showbook/search/presentation/pages/search_screen.dart' as _i18;
import 'package:showbook/shared/pages/splash.dart' as _i19;
import 'package:showbook/shared/widgets/vertical_menu.dart' as _i20;
import 'package:showbook/user_event/presentation/pages/my_event.dart' as _i21;

abstract class $AppRouter extends _i22.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    FollowedListRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.FollowedListScreen(),
      );
    },
    MyAccountRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MyAccountScreen(),
      );
    },
    NotificationListRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.NotificationListScreen(),
      );
    },
    TicketListRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.TicketListScreen(),
      );
    },
    ApplicationRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ApplicationScreen(),
      );
    },
    ForgotPwdRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ForgotPwdScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginScreen(),
      );
    },
    ResetPwdRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ResetPwdScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SignupScreen(),
      );
    },
    CategoryListRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CategoryListScreen(),
      );
    },
    Coming.name: (routeData) {
      final args = routeData.argsAs<ComingArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.Coming(
          key: args.key,
          profilModel: args.profilModel,
        ),
      );
    },
    DetailEventRoute.name: (routeData) {
      final args = routeData.argsAs<DetailEventRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.DetailEventScreen(
          key: args.key,
          event: args.event,
        ),
      );
    },
    DetailProfilRoute.name: (routeData) {
      final args = routeData.argsAs<DetailProfilRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.DetailProfilScreen(
          key: args.key,
          profil: args.profil,
        ),
      );
    },
    ForYouRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ForYouScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.HomeScreen(),
      );
    },
    PastEventProfilRoute.name: (routeData) {
      final args = routeData.argsAs<PastEventProfilRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.PastEventProfilScreen(
          key: args.key,
          profilModel: args.profilModel,
        ),
      );
    },
    EventListRoute.name: (routeData) {
      final args = routeData.argsAs<EventListRouteArgs>(
          orElse: () => const EventListRouteArgs());
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.EventListScreen(key: args.key),
      );
    },
    SearchRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SearchScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.SplashScreen(),
      );
    },
    VerticalMenuRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.VerticalMenuScreen(),
      );
    },
    MyEventRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.MyEventScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.FollowedListScreen]
class FollowedListRoute extends _i22.PageRouteInfo<void> {
  const FollowedListRoute({List<_i22.PageRouteInfo>? children})
      : super(
          FollowedListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FollowedListRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MyAccountScreen]
class MyAccountRoute extends _i22.PageRouteInfo<void> {
  const MyAccountRoute({List<_i22.PageRouteInfo>? children})
      : super(
          MyAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAccountRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i3.NotificationListScreen]
class NotificationListRoute extends _i22.PageRouteInfo<void> {
  const NotificationListRoute({List<_i22.PageRouteInfo>? children})
      : super(
          NotificationListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationListRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TicketListScreen]
class TicketListRoute extends _i22.PageRouteInfo<void> {
  const TicketListRoute({List<_i22.PageRouteInfo>? children})
      : super(
          TicketListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketListRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ApplicationScreen]
class ApplicationRoute extends _i22.PageRouteInfo<void> {
  const ApplicationRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ApplicationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplicationRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ForgotPwdScreen]
class ForgotPwdRoute extends _i22.PageRouteInfo<void> {
  const ForgotPwdRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ForgotPwdRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPwdRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginScreen]
class LoginRoute extends _i22.PageRouteInfo<void> {
  const LoginRoute({List<_i22.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ResetPwdScreen]
class ResetPwdRoute extends _i22.PageRouteInfo<void> {
  const ResetPwdRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ResetPwdRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPwdRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SignupScreen]
class SignupRoute extends _i22.PageRouteInfo<void> {
  const SignupRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i10.CategoryListScreen]
class CategoryListRoute extends _i22.PageRouteInfo<void> {
  const CategoryListRoute({List<_i22.PageRouteInfo>? children})
      : super(
          CategoryListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryListRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Coming]
class Coming extends _i22.PageRouteInfo<ComingArgs> {
  Coming({
    _i23.Key? key,
    required _i24.ProfilModel profilModel,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          Coming.name,
          args: ComingArgs(
            key: key,
            profilModel: profilModel,
          ),
          initialChildren: children,
        );

  static const String name = 'Coming';

  static const _i22.PageInfo<ComingArgs> page = _i22.PageInfo<ComingArgs>(name);
}

class ComingArgs {
  const ComingArgs({
    this.key,
    required this.profilModel,
  });

  final _i23.Key? key;

  final _i24.ProfilModel profilModel;

  @override
  String toString() {
    return 'ComingArgs{key: $key, profilModel: $profilModel}';
  }
}

/// generated route for
/// [_i12.DetailEventScreen]
class DetailEventRoute extends _i22.PageRouteInfo<DetailEventRouteArgs> {
  DetailEventRoute({
    _i23.Key? key,
    required _i25.EventModel event,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          DetailEventRoute.name,
          args: DetailEventRouteArgs(
            key: key,
            event: event,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailEventRoute';

  static const _i22.PageInfo<DetailEventRouteArgs> page =
      _i22.PageInfo<DetailEventRouteArgs>(name);
}

class DetailEventRouteArgs {
  const DetailEventRouteArgs({
    this.key,
    required this.event,
  });

  final _i23.Key? key;

  final _i25.EventModel event;

  @override
  String toString() {
    return 'DetailEventRouteArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [_i13.DetailProfilScreen]
class DetailProfilRoute extends _i22.PageRouteInfo<DetailProfilRouteArgs> {
  DetailProfilRoute({
    _i23.Key? key,
    required _i24.ProfilModel profil,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          DetailProfilRoute.name,
          args: DetailProfilRouteArgs(
            key: key,
            profil: profil,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailProfilRoute';

  static const _i22.PageInfo<DetailProfilRouteArgs> page =
      _i22.PageInfo<DetailProfilRouteArgs>(name);
}

class DetailProfilRouteArgs {
  const DetailProfilRouteArgs({
    this.key,
    required this.profil,
  });

  final _i23.Key? key;

  final _i24.ProfilModel profil;

  @override
  String toString() {
    return 'DetailProfilRouteArgs{key: $key, profil: $profil}';
  }
}

/// generated route for
/// [_i14.ForYouScreen]
class ForYouRoute extends _i22.PageRouteInfo<void> {
  const ForYouRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ForYouRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForYouRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i15.HomeScreen]
class HomeRoute extends _i22.PageRouteInfo<void> {
  const HomeRoute({List<_i22.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PastEventProfilScreen]
class PastEventProfilRoute
    extends _i22.PageRouteInfo<PastEventProfilRouteArgs> {
  PastEventProfilRoute({
    _i23.Key? key,
    required _i24.ProfilModel profilModel,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          PastEventProfilRoute.name,
          args: PastEventProfilRouteArgs(
            key: key,
            profilModel: profilModel,
          ),
          initialChildren: children,
        );

  static const String name = 'PastEventProfilRoute';

  static const _i22.PageInfo<PastEventProfilRouteArgs> page =
      _i22.PageInfo<PastEventProfilRouteArgs>(name);
}

class PastEventProfilRouteArgs {
  const PastEventProfilRouteArgs({
    this.key,
    required this.profilModel,
  });

  final _i23.Key? key;

  final _i24.ProfilModel profilModel;

  @override
  String toString() {
    return 'PastEventProfilRouteArgs{key: $key, profilModel: $profilModel}';
  }
}

/// generated route for
/// [_i17.EventListScreen]
class EventListRoute extends _i22.PageRouteInfo<EventListRouteArgs> {
  EventListRoute({
    _i23.Key? key,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          EventListRoute.name,
          args: EventListRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EventListRoute';

  static const _i22.PageInfo<EventListRouteArgs> page =
      _i22.PageInfo<EventListRouteArgs>(name);
}

class EventListRouteArgs {
  const EventListRouteArgs({this.key});

  final _i23.Key? key;

  @override
  String toString() {
    return 'EventListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.SearchScreen]
class SearchRoute extends _i22.PageRouteInfo<void> {
  const SearchRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i19.SplashScreen]
class SplashRoute extends _i22.PageRouteInfo<void> {
  const SplashRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i20.VerticalMenuScreen]
class VerticalMenuRoute extends _i22.PageRouteInfo<void> {
  const VerticalMenuRoute({List<_i22.PageRouteInfo>? children})
      : super(
          VerticalMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerticalMenuRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i21.MyEventScreen]
class MyEventRoute extends _i22.PageRouteInfo<void> {
  const MyEventRoute({List<_i22.PageRouteInfo>? children})
      : super(
          MyEventRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyEventRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}
