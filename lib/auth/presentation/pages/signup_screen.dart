import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:showbook/shared/widgets/button_widget.dart';
import 'package:showbook/auth/presentation/widgets/header_form_widget.dart';
import 'package:showbook/shared/widgets/input_widget.dart';
import 'package:showbook/shared/routes/routes.gr.dart';

import '../../../shared/utils/app_colors.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isVisible = true;
  late TextEditingController _emailController;
  late TextEditingController _passwwdController;

  @override
  void initState() {
    _emailController = TextEditingController();
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
              const HeaderFormWidget(text: 'Sign up'),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    InputWidget(
                      controller: _emailController,
                      keyboardType: TextInputType.name,
                      label: 'Name',
                      prefixIcon: const Icon(Icons.person),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
                    ButtonWidget(
                      borderColor: AppColors.primary,
                      bgColor: AppColors.primary,
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      fontSize: 17,
                      text: 'Continue',
                      textColor: AppColors.white,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            const TextSpan(
                              text: 'Already an account?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign in!',
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.router.push(const LoginRoute());
                                },
                            ),
                          ]),
                        ),
                      ],
                    )
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
