import 'package:auto_route/auto_route.dart';

import 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
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
      ];
}
