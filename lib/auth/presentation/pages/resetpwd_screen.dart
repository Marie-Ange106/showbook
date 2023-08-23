import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:showbook/shared/widgets/button_widget.dart';
import 'package:showbook/auth/presentation/widgets/header_form_widget.dart';
import 'package:showbook/shared/widgets/input_widget.dart';

import '../../../shared/utils/app_colors.dart';

@RoutePage()
class ResetPwdScreen extends StatefulWidget {
  const ResetPwdScreen({super.key});

  @override
  State<ResetPwdScreen> createState() => _ResetPwdScreenState();
}

class _ResetPwdScreenState extends State<ResetPwdScreen> {
  bool _isVisible = true;
  late TextEditingController _passwwdController;

  @override
  void initState() {
    _passwwdController = TextEditingController();
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
              const HeaderFormWidget(
                text: 'Forgot password',
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    InputWidget(
                      controller: _passwwdController,
                      keyboardType: TextInputType.visiblePassword,
                      label: 'Password',
                      prefixIcon: const Icon(Icons.password),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      obscureText: _isVisible,
                      suffixIcon: IconButton(
                        icon: Icon(_isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputWidget(
                      controller: _passwwdController,
                      keyboardType: TextInputType.visiblePassword,
                      label: 'Confirm password',
                      prefixIcon: const Icon(Icons.password),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      obscureText: _isVisible,
                      suffixIcon: IconButton(
                        icon: Icon(_isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 40,
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
                          onPressed: () {
                            // context.router.push(route)
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
