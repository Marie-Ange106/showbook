import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:showbook/shared/routes/routes.gr.dart';

import '../../../shared/utils/app_colors.dart';
import '../../../shared/widgets/button_widget.dart';
import '../../../shared/widgets/input_widget.dart';
import '../../business_logic/cubit/auth_cubit.dart';
import '../widgets/header_form_widget.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isVisible = true;
  late TextEditingController _emailController;
  late TextEditingController _passwwdController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwwdController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.errorLoginging) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message.toString(),
                ),
              ),
            );
          }
          if (state.sucessLoginging) {
            context.router.pushAndPopUntil(
              const ApplicationRoute(),
              predicate: (_) => false,
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Welcome!',
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const HeaderFormWidget(
                    text: 'Log in',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          InputWidget(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            label: 'Email',
                            prefixIcon: const Icon(Icons.email_outlined),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15),
                            validators: [
                              FormBuilderValidators.required(
                                errorText: "Email is required",
                              ),
                              FormBuilderValidators.email(
                                errorText: "Enter valided email adresse",
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InputWidget(
                            controller: _passwwdController,
                            keyboardType: TextInputType.visiblePassword,
                            label: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15),
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
                            validators: [
                              FormBuilderValidators.required(
                                errorText: "Password is required",
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().login(
                                          email: _emailController.text,
                                          password: _passwwdController.text,
                                        );
                                  }
                                },
                                child: ButtonWidget(
                                  borderColor: AppColors.primary,
                                  bgColor: AppColors.primary,
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  fontSize: 17,
                                  text: 'Continue',
                                  textColor: AppColors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context.router
                                          .push(const ForgotPwdRoute());
                                    },
                                    child: const Text(
                                      'Forgot password?',
                                      style: TextStyle(
                                        color: Colors.red,
                                        // fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              if (state.isLoginging)
                                const Center(
                                  child: CircularProgressIndicator(),
                                ),
                            ],
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
                                    text: 'Don\'t have an account?',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign up!',
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.router
                                            .push(const SignupRoute());
                                      },
                                  ),
                                ]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
