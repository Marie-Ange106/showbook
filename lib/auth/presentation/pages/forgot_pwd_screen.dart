import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:showbook/shared/widgets/button_widget.dart';
import 'package:showbook/auth/presentation/widgets/header_form_widget.dart';
import 'package:showbook/shared/widgets/input_widget.dart';
import 'package:showbook/shared/routes/routes.gr.dart';

import '../../../shared/utils/app_colors.dart';

@RoutePage()
class ForgotPwdScreen extends StatefulWidget {
  const ForgotPwdScreen({super.key});

  @override
  State<ForgotPwdScreen> createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {
  late TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const HeaderFormWidget(
                text: 'Forgot password',
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Require informations to your account ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    InputWidget(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      label: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        ButtonWidget(
                          borderColor: AppColors.primary,
                          bgColor: AppColors.primary,
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          text: 'Confirm email',
                          textColor: AppColors.white,
                          fontSize: 17,
                          onTap: () {
                            context.router.push(const ResetPwdRoute());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
