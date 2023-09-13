import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/auth/business_logic/cubit/auth_cubit.dart';
import 'package:showbook/shared/utils/app_colors.dart';
import 'package:showbook/shared/widgets/button_widget.dart';

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
      body: BlocBuilder<AuthCubit, AuthState>(
        // bloc: getIt.get<AuthCubit>()..getUser(),
        builder: (context, state) {
          var user = state.user;
          print(user);
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
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Container(
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ItemSettingWidget(
                                      name: 'Edit Profil',
                                      icon: Icons.edit,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ItemSettingWidget(
                                      name: 'Notification',
                                      icon: Icons.notifications_active,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ItemSettingWidget(
                                      name: 'Dark Mode',
                                      icon: Icons.dark_mode,
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    ItemSettingWidget(
                                      width: 100,
                                      name: 'Logout',
                                      icon: Icons.logout,
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
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
