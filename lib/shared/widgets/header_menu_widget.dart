import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/auth/business_logic/cubit/auth_cubit.dart';
import 'package:showbook/service_locator.dart';

import '../utils/app_colors.dart';

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
      bloc: getIt.get<AuthCubit>()..getUser(),
      builder: ((context, state) {
        var user = state.user;
        if (state.sucessTcheckUser) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: AppColors.grayScale,
                        child: Icon(Icons.person),
                      ),
                      SizedBox(
                        width: 200,
                        child: Column(
                          children: [
                            Text(
                              user!.name,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              user.email,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider()
            ],
          );
        }

        // return SizedBox(
        //   height: 120,
        //   child: DrawerHeader(
        //     child: ListTile(
        //       iconColor: AppColors.secondary,
        //       textColor: AppColors.secondary,
        //       selectedTileColor: AppColors.grayScale,
        //       leading: const CircleAvatar(
        //         backgroundColor: AppColors.grayScale,
        //         child: Icon(Icons.person),
        //       ),
        //       title: Padding(
        //         padding: const EdgeInsets.only(right: 50),
        //         child: GestureDetector(
        //           onTap: () {
        //             context.router.push(const LoginRoute());
        //           },
        //           child: const ButtonWidget(
        //             text: 'Login',
        //             borderColor: AppColors.tertiary,
        //             height: 40,
        //             width: 100,
        //             fontSize: 14,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // );

        return Container();
      }),
    );
  }
}
