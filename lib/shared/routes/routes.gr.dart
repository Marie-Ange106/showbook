// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i28;
import 'package:flutter/material.dart' as _i29;
import 'package:showbook/account/pages/delete_account_screen.dart' as _i26;
import 'package:showbook/account/pages/followed_list_screen.dart' as _i1;
import 'package:showbook/account/pages/my_account_screen.dart' as _i2;
import 'package:showbook/account/pages/notification_list_screen.dart' as _i3;
import 'package:showbook/account/pages/settings_screen.dart' as _i4;
import 'package:showbook/account/pages/ticket_list_screen.dart' as _i5;
import 'package:showbook/account/pages/update_info_user_screen.dart' as _i27;
import 'package:showbook/account/pages/update_password.dart' as _i25;
import 'package:showbook/application_screen.dart' as _i6;
import 'package:showbook/auth/data/user_model.dart' as _i30;
import 'package:showbook/auth/presentation/pages/forgot_pwd_screen.dart' as _i7;
import 'package:showbook/auth/presentation/pages/login_screen.dart' as _i8;
import 'package:showbook/auth/presentation/pages/resetpwd_screen.dart' as _i9;
import 'package:showbook/auth/presentation/pages/signup_screen.dart' as _i10;
import 'package:showbook/auth/presentation/pages/sucess_register_secreen.dart'
    as _i11;
import 'package:showbook/category/presentation/pages/categories_list_screen.dart'
    as _i12;
import 'package:showbook/event/data/models/event_model.dart' as _i32;
import 'package:showbook/event/presentation/pages/add_event_screen.dart'
    as _i13;
import 'package:showbook/event/presentation/pages/coming_event_profil.dart'
    as _i14;
import 'package:showbook/event/presentation/pages/detail_event_screen.dart'
    as _i15;
import 'package:showbook/event/presentation/pages/past_event_profil_screen.dart'
    as _i16;
import 'package:showbook/favorite_event/presentation/pages/favorite_event_screen.dart'
    as _i17;
import 'package:showbook/profil/data/models/profil_model.dart' as _i31;
import 'package:showbook/profil/presentation/pages/detail_profil_screen.dart'
    as _i18;
import 'package:showbook/search/presentation/pages/event_list_screen.dart'
    as _i19;
import 'package:showbook/search/presentation/pages/search_screen.dart' as _i20;
import 'package:showbook/shared/pages/for_you_screen.dart' as _i21;
import 'package:showbook/shared/pages/home_screen.dart' as _i22;
import 'package:showbook/shared/pages/splash.dart' as _i23;
import 'package:showbook/shared/widgets/vertical_menu.dart' as _i24;

abstract class $AppRouter extends _i28.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i28.PageFactory> pagesMap = {
    FollowedListRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.FollowedListScreen(),
      );
    },
    MyAccountRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MyAccountScreen(),
      );
    },
    NotificationListRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.NotificationListScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SettingsScreen(),
      );
    },
    TicketListRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TicketListScreen(),
      );
    },
    ApplicationRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ApplicationScreen(),
      );
    },
    ForgotPwdRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ForgotPwdScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginScreen(),
      );
    },
    ResetPwdRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ResetPwdScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SignupScreen(),
      );
    },
    SucessRegisterRoute.name: (routeData) {
      final args = routeData.argsAs<SucessRegisterRouteArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SucessRegisterScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
    CategoryListRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.CategoryListScreen(),
      );
    },
    AddEventRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.AddEventScreen(),
      );
    },
    Coming.name: (routeData) {
      final args = routeData.argsAs<ComingArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.Coming(
          key: args.key,
          profilModel: args.profilModel,
        ),
      );
    },
    DetailEventRoute.name: (routeData) {
      final args = routeData.argsAs<DetailEventRouteArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.DetailEventScreen(
          key: args.key,
          event: args.event,
        ),
      );
    },
    PastEventProfilRoute.name: (routeData) {
      final args = routeData.argsAs<PastEventProfilRouteArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.PastEventProfilScreen(
          key: args.key,
          profilModel: args.profilModel,
        ),
      );
    },
    FavoriteEVentRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.FavoriteEVentScreen(),
      );
    },
    DetailProfilRoute.name: (routeData) {
      final args = routeData.argsAs<DetailProfilRouteArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.DetailProfilScreen(
          key: args.key,
          profil: args.profil,
        ),
      );
    },
    EventListRoute.name: (routeData) {
      final args = routeData.argsAs<EventListRouteArgs>(
          orElse: () => const EventListRouteArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.EventListScreen(key: args.key),
      );
    },
    SearchRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.SearchScreen(),
      );
    },
    ForYouRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.ForYouScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.HomeScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.SplashScreen(),
      );
    },
    VerticalMenuRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.VerticalMenuScreen(),
      );
    },
    UpdatePwdRoute.name: (routeData) {
      final args = routeData.argsAs<UpdatePwdRouteArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.UpdatePwdScreen(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    DeleteAccountRoute.name: (routeData) {
      final args = routeData.argsAs<DeleteAccountRouteArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.DeleteAccountScreen(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    UserInfoRoute.name: (routeData) {
      final args = routeData.argsAs<UserInfoRouteArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.UserInfoScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.FollowedListScreen]
class FollowedListRoute extends _i28.PageRouteInfo<void> {
  const FollowedListRoute({List<_i28.PageRouteInfo>? children})
      : super(
          FollowedListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FollowedListRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MyAccountScreen]
class MyAccountRoute extends _i28.PageRouteInfo<void> {
  const MyAccountRoute({List<_i28.PageRouteInfo>? children})
      : super(
          MyAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAccountRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i3.NotificationListScreen]
class NotificationListRoute extends _i28.PageRouteInfo<void> {
  const NotificationListRoute({List<_i28.PageRouteInfo>? children})
      : super(
          NotificationListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationListRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SettingsScreen]
class SettingsRoute extends _i28.PageRouteInfo<void> {
  const SettingsRoute({List<_i28.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TicketListScreen]
class TicketListRoute extends _i28.PageRouteInfo<void> {
  const TicketListRoute({List<_i28.PageRouteInfo>? children})
      : super(
          TicketListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketListRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ApplicationScreen]
class ApplicationRoute extends _i28.PageRouteInfo<void> {
  const ApplicationRoute({List<_i28.PageRouteInfo>? children})
      : super(
          ApplicationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplicationRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ForgotPwdScreen]
class ForgotPwdRoute extends _i28.PageRouteInfo<void> {
  const ForgotPwdRoute({List<_i28.PageRouteInfo>? children})
      : super(
          ForgotPwdRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPwdRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginScreen]
class LoginRoute extends _i28.PageRouteInfo<void> {
  const LoginRoute({List<_i28.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ResetPwdScreen]
class ResetPwdRoute extends _i28.PageRouteInfo<void> {
  const ResetPwdRoute({List<_i28.PageRouteInfo>? children})
      : super(
          ResetPwdRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPwdRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SignupScreen]
class SignupRoute extends _i28.PageRouteInfo<void> {
  const SignupRoute({List<_i28.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SucessRegisterScreen]
class SucessRegisterRoute extends _i28.PageRouteInfo<SucessRegisterRouteArgs> {
  SucessRegisterRoute({
    _i29.Key? key,
    required _i30.UserModel user,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          SucessRegisterRoute.name,
          args: SucessRegisterRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'SucessRegisterRoute';

  static const _i28.PageInfo<SucessRegisterRouteArgs> page =
      _i28.PageInfo<SucessRegisterRouteArgs>(name);
}

class SucessRegisterRouteArgs {
  const SucessRegisterRouteArgs({
    this.key,
    required this.user,
  });

  final _i29.Key? key;

  final _i30.UserModel user;

  @override
  String toString() {
    return 'SucessRegisterRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i12.CategoryListScreen]
class CategoryListRoute extends _i28.PageRouteInfo<void> {
  const CategoryListRoute({List<_i28.PageRouteInfo>? children})
      : super(
          CategoryListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryListRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i13.AddEventScreen]
class AddEventRoute extends _i28.PageRouteInfo<void> {
  const AddEventRoute({List<_i28.PageRouteInfo>? children})
      : super(
          AddEventRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddEventRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i14.Coming]
class Coming extends _i28.PageRouteInfo<ComingArgs> {
  Coming({
    _i29.Key? key,
    required _i31.ProfilModel profilModel,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          Coming.name,
          args: ComingArgs(
            key: key,
            profilModel: profilModel,
          ),
          initialChildren: children,
        );

  static const String name = 'Coming';

  static const _i28.PageInfo<ComingArgs> page = _i28.PageInfo<ComingArgs>(name);
}

class ComingArgs {
  const ComingArgs({
    this.key,
    required this.profilModel,
  });

  final _i29.Key? key;

  final _i31.ProfilModel profilModel;

  @override
  String toString() {
    return 'ComingArgs{key: $key, profilModel: $profilModel}';
  }
}

/// generated route for
/// [_i15.DetailEventScreen]
class DetailEventRoute extends _i28.PageRouteInfo<DetailEventRouteArgs> {
  DetailEventRoute({
    _i29.Key? key,
    required _i32.EventModel event,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          DetailEventRoute.name,
          args: DetailEventRouteArgs(
            key: key,
            event: event,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailEventRoute';

  static const _i28.PageInfo<DetailEventRouteArgs> page =
      _i28.PageInfo<DetailEventRouteArgs>(name);
}

class DetailEventRouteArgs {
  const DetailEventRouteArgs({
    this.key,
    required this.event,
  });

  final _i29.Key? key;

  final _i32.EventModel event;

  @override
  String toString() {
    return 'DetailEventRouteArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [_i16.PastEventProfilScreen]
class PastEventProfilRoute
    extends _i28.PageRouteInfo<PastEventProfilRouteArgs> {
  PastEventProfilRoute({
    _i29.Key? key,
    required _i31.ProfilModel profilModel,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          PastEventProfilRoute.name,
          args: PastEventProfilRouteArgs(
            key: key,
            profilModel: profilModel,
          ),
          initialChildren: children,
        );

  static const String name = 'PastEventProfilRoute';

  static const _i28.PageInfo<PastEventProfilRouteArgs> page =
      _i28.PageInfo<PastEventProfilRouteArgs>(name);
}

class PastEventProfilRouteArgs {
  const PastEventProfilRouteArgs({
    this.key,
    required this.profilModel,
  });

  final _i29.Key? key;

  final _i31.ProfilModel profilModel;

  @override
  String toString() {
    return 'PastEventProfilRouteArgs{key: $key, profilModel: $profilModel}';
  }
}

/// generated route for
/// [_i17.FavoriteEVentScreen]
class FavoriteEVentRoute extends _i28.PageRouteInfo<void> {
  const FavoriteEVentRoute({List<_i28.PageRouteInfo>? children})
      : super(
          FavoriteEVentRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteEVentRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i18.DetailProfilScreen]
class DetailProfilRoute extends _i28.PageRouteInfo<DetailProfilRouteArgs> {
  DetailProfilRoute({
    _i29.Key? key,
    required _i31.ProfilModel profil,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          DetailProfilRoute.name,
          args: DetailProfilRouteArgs(
            key: key,
            profil: profil,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailProfilRoute';

  static const _i28.PageInfo<DetailProfilRouteArgs> page =
      _i28.PageInfo<DetailProfilRouteArgs>(name);
}

class DetailProfilRouteArgs {
  const DetailProfilRouteArgs({
    this.key,
    required this.profil,
  });

  final _i29.Key? key;

  final _i31.ProfilModel profil;

  @override
  String toString() {
    return 'DetailProfilRouteArgs{key: $key, profil: $profil}';
  }
}

/// generated route for
/// [_i19.EventListScreen]
class EventListRoute extends _i28.PageRouteInfo<EventListRouteArgs> {
  EventListRoute({
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          EventListRoute.name,
          args: EventListRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EventListRoute';

  static const _i28.PageInfo<EventListRouteArgs> page =
      _i28.PageInfo<EventListRouteArgs>(name);
}

class EventListRouteArgs {
  const EventListRouteArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'EventListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i20.SearchScreen]
class SearchRoute extends _i28.PageRouteInfo<void> {
  const SearchRoute({List<_i28.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ForYouScreen]
class ForYouRoute extends _i28.PageRouteInfo<void> {
  const ForYouRoute({List<_i28.PageRouteInfo>? children})
      : super(
          ForYouRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForYouRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i22.HomeScreen]
class HomeRoute extends _i28.PageRouteInfo<void> {
  const HomeRoute({List<_i28.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SplashScreen]
class SplashRoute extends _i28.PageRouteInfo<void> {
  const SplashRoute({List<_i28.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i24.VerticalMenuScreen]
class VerticalMenuRoute extends _i28.PageRouteInfo<void> {
  const VerticalMenuRoute({List<_i28.PageRouteInfo>? children})
      : super(
          VerticalMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerticalMenuRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i25.UpdatePwdScreen]
class UpdatePwdRoute extends _i28.PageRouteInfo<UpdatePwdRouteArgs> {
  UpdatePwdRoute({
    _i29.Key? key,
    required int userId,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          UpdatePwdRoute.name,
          args: UpdatePwdRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdatePwdRoute';

  static const _i28.PageInfo<UpdatePwdRouteArgs> page =
      _i28.PageInfo<UpdatePwdRouteArgs>(name);
}

class UpdatePwdRouteArgs {
  const UpdatePwdRouteArgs({
    this.key,
    required this.userId,
  });

  final _i29.Key? key;

  final int userId;

  @override
  String toString() {
    return 'UpdatePwdRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i26.DeleteAccountScreen]
class DeleteAccountRoute extends _i28.PageRouteInfo<DeleteAccountRouteArgs> {
  DeleteAccountRoute({
    _i29.Key? key,
    required int userId,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          DeleteAccountRoute.name,
          args: DeleteAccountRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'DeleteAccountRoute';

  static const _i28.PageInfo<DeleteAccountRouteArgs> page =
      _i28.PageInfo<DeleteAccountRouteArgs>(name);
}

class DeleteAccountRouteArgs {
  const DeleteAccountRouteArgs({
    this.key,
    required this.userId,
  });

  final _i29.Key? key;

  final int userId;

  @override
  String toString() {
    return 'DeleteAccountRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i27.UserInfoScreen]
class UserInfoRoute extends _i28.PageRouteInfo<UserInfoRouteArgs> {
  UserInfoRoute({
    _i29.Key? key,
    required _i30.UserModel user,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          UserInfoRoute.name,
          args: UserInfoRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'UserInfoRoute';

  static const _i28.PageInfo<UserInfoRouteArgs> page =
      _i28.PageInfo<UserInfoRouteArgs>(name);
}

class UserInfoRouteArgs {
  const UserInfoRouteArgs({
    this.key,
    required this.user,
  });

  final _i29.Key? key;

  final _i30.UserModel user;

  @override
  String toString() {
    return 'UserInfoRouteArgs{key: $key, user: $user}';
  }
}
