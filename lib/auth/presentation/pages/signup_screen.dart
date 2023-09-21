import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:showbook/shared/widgets/button_widget.dart';
import 'package:showbook/auth/presentation/widgets/header_form_widget.dart';
import 'package:showbook/shared/widgets/input_widget.dart';
import 'package:showbook/shared/routes/routes.gr.dart';

import '../../../shared/utils/app_colors.dart';
import '../../business_logic/cubit/auth_cubit.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isVisible = true;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwwdController;
  late TextEditingController _confirmPwdController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwwdController = TextEditingController();
    _confirmPwdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.errorRegistering) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message.toString(),
                ),
              ),
            );
          }
          if (state.sucessRegistering) {
            var user = state.user;
            context.router.pushAndPopUntil(
              SucessRegisterRoute(user: user!),
              predicate: (_) => false,
            );
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text(
            //       "Welcome ${user.name}!",
            //     ),
            //   ),
            // );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HeaderFormWidget(text: 'Sign up'),
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
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            label: 'Name',
                            prefixIcon: const Icon(Icons.person),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15),
                            validators: [
                              FormBuilderValidators.required(
                                errorText: "Name is required",
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
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
                            height: 15,
                          ),
                          InputWidget(
                            controller: _confirmPwdController,
                            keyboardType: TextInputType.visiblePassword,
                            label: 'Confirm password',
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
                                errorText: "Confirm password is required",
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().register(
                                      name: _nameController.text,
                                      email: _emailController.text,
                                      password: _passwwdController.text,
                                    );
                                    // context.read<AuthCubit>().getUser();
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
                            height: 10,
                          ),
                          if (state.isRegistering)
                            const Center(
                              child: CircularProgressIndicator(),
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
                                    text: 'Already have an account?',
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
