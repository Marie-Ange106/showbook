import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:showbook/shared/routes/routes.gr.dart';
import 'package:showbook/shared/utils/app_colors.dart';
import 'package:showbook/shared/widgets/button_widget.dart';

import '../../data/user_model.dart';

@RoutePage()
class SucessRegisterScreen extends StatelessWidget {
  final UserModel user;
  const SucessRegisterScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/register.png'),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  'Success',
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.secondary,
                    decoration: TextDecoration.none,
                    fontFamily: AutofillHints.familyName,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  'Congratulations ${user.name} , you are now a member of Showbook!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.secondary,
                    decoration: TextDecoration.none,
                    fontFamily: AutofillHints.familyName,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () {
                    context.router.push(const ApplicationRoute());
                  },
                  child: const ButtonWidget(
                    text: 'Continue',
                    borderColor: AppColors.secondary,
                    bgColor: AppColors.secondary,
                    textColor: AppColors.white,
                    height: 40,
                    width: 190,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
