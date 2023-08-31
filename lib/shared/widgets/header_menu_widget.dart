import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/auth/business_logic/cubit/auth_cubit.dart';
import 'package:showbook/service_locator.dart';

import '../routes/routes.gr.dart';
import '../utils/app_colors.dart';
import 'button_widget.dart';

class HeaderMenuWidget extends StatefulWidget {
  const HeaderMenuWidget({
    super.key,
  });

  @override
  State<HeaderMenuWidget> createState() => _HeaderMenuWidgetState();
}

class _HeaderMenuWidgetState extends State<HeaderMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      // bloc: getIt.get<AuthCubit>()..getUser(),
      builder: ((context, state) {
        if (state.sucessTcheckUser) {
          getIt.get<AuthCubit>().getUser();
          var user = state.user;
          return SizedBox(
            height: 120,
            child: DrawerHeader(
              child: ListTile(
                iconColor: AppColors.secondary,
                textColor: AppColors.secondary,
                selectedTileColor: AppColors.grayScale,
                leading: const CircleAvatar(
                  backgroundColor: AppColors.grayScale,
                  child: Icon(Icons.person),
                ),
                title: Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Column(
                      children: [
                        Text(user!.name),
                        Text(user.email),
                      ],
                    )),
              ),
            ),
          );
        }
        if (state.failureTcheckUser) {
          return SizedBox(
            height: 120,
            child: DrawerHeader(
              child: ListTile(
                iconColor: AppColors.secondary,
                textColor: AppColors.secondary,
                selectedTileColor: AppColors.grayScale,
                leading: const CircleAvatar(
                  backgroundColor: AppColors.grayScale,
                  child: Icon(Icons.person),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: GestureDetector(
                    onTap: () {
                      context.router.push(const LoginRoute());
                    },
                    child: const ButtonWidget(
                      text: 'Login',
                      borderColor: AppColors.tertiary,
                      height: 40,
                      width: 100,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }
}
