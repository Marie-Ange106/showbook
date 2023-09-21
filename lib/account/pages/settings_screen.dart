import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/auth/business_logic/cubit/auth_cubit.dart';
import 'package:showbook/auth/data/auth_repository.dart';
import 'package:showbook/service_locator.dart';
import 'package:showbook/shared/utils/app_colors.dart';
import 'package:showbook/shared/widgets/button_widget.dart';

import '../../shared/routes/routes.gr.dart';
import '../widgets/item_setting_widget.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryClair,
        title: const Text(
          'Settings',
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<AuthCubit, AuthState>(
          // bloc: getIt.get<AuthCubit>()..getUser(),
          builder: (context, state) {
            var user = state.user;

            return Stack(
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryClair,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(30),
                        topEnd: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        // header**********************
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 52,
                                backgroundColor: AppColors.primary,
                              ),
                              CircleAvatar(
                                radius: 50,
                                backgroundColor:
                                    Color.fromARGB(255, 232, 231, 231),
                                child: Icon(
                                  Icons.person,
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // si on a un user connecté
                        if (state.sucessTcheckUser)
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                user!.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                user.email,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          context.router
                                              .push(UserInfoRoute(user: user));
                                        },
                                        child: const ItemSettingWidget(
                                          name: 'Edit Profil',
                                          icon: Icons.edit,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          context.router.push(
                                              UpdatePwdRoute(userId: user.id));
                                        },
                                        child: const ItemSettingWidget(
                                          name: 'Change my password',
                                          icon: Icons.edit,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          context.router.push(DeleteAccountRoute(userId: user.id));
                                        },
                                        child: const ItemSettingWidget(
                                          name: 'Delete my account',
                                          icon: Icons.delete,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: const ItemSettingWidget(
                                          name: 'Manage an event',
                                          icon: Icons.calendar_month,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const ItemSettingWidget(
                                        name: 'Notification',
                                        icon: Icons.notifications_active,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const ItemSettingWidget(
                                        name: 'Dark Mode',
                                        icon: Icons.dark_mode,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          getIt.get<AuthRepository>().logout();
                                          getIt.get<AuthCubit>().getUser();
                                          context.router.push(
                                            const ApplicationRoute(),
                                          );
                                        },
                                        child: const ItemSettingWidget(
                                          width: 100,
                                          name: 'Logout',
                                          icon: Icons.logout,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        else
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    context.router.push(const LoginRoute());
                                  },
                                  child: const ButtonWidget(
                                    text: 'Connexion',
                                    textColor: AppColors.white,
                                    borderColor: AppColors.primary,
                                    bgColor: AppColors.primary,
                                    height: 40,
                                    width: 200,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            ],
                          )
                        // else
                        //   Column(
                        //     children: [
                        //       const SizedBox(
                        //         height: 30,
                        //       ),
                        //       Container(
                        //         child: const ButtonWidget(
                        //           text: 'Connexion',
                        //           textColor: AppColors.white,
                        //           borderColor: AppColors.primary,
                        //           bgColor: AppColors.primary,
                        //           height: 40,
                        //           width: 200,
                        //           fontSize: 18,
                        //         ),
                        //       ),
                        //     ],
                        //   )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
