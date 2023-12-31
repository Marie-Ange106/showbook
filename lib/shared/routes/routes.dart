import 'package:auto_route/auto_route.dart';

import 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: SignupRoute.page,
        ),
        AutoRoute(
          page: ForgotPwdRoute.page,
        ),
        AutoRoute(
          page: ResetPwdRoute.page,
        ),
        AutoRoute(
          page: ApplicationRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: DetailEventRoute.page,
        ),
        AutoRoute(
          page: SearchRoute.page,
        ),
        AutoRoute(
          page: MyAccountRoute.page,
        ),
        AutoRoute(
          page: DetailProfilRoute.page,
        ),
        AutoRoute(
          page: PastEventProfilRoute.page,
        ),
        AutoRoute(
          page: Coming.page,
        ),
        AutoRoute(page: DetailProfilRoute.page),
        AutoRoute(
          page: EventListRoute.page,
        ),
        AutoRoute(
          page: VerticalMenuRoute.page,
        ),
        AutoRoute(
          page: CategoryListRoute.page,
        ),
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: SucessRegisterRoute.page,
        ),
        AutoRoute(
          page: SettingsRoute.page,
        ),
        AutoRoute(
          page: AddEventRoute.page,
        ),
        AutoRoute(
          page: UserInfoRoute.page,
        ),
        AutoRoute(
          page: UpdatePwdRoute.page,
        ),
        AutoRoute(
          page: DeleteAccountRoute.page,
        ),
      ];
}
