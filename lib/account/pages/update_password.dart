import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/business_logic/cubit/auth_cubit.dart';
import '../../service_locator.dart';
import '../../shared/routes/routes.gr.dart';
import '../../shared/utils/app_colors.dart';
import '../../shared/widgets/button_widget.dart';
import '../../shared/widgets/input_widget.dart';
import '../business_logic/cubit/user_cubit.dart';

@RoutePage()
class UpdatePwdScreen extends StatefulWidget {
  final int userId;
  const UpdatePwdScreen({super.key, required this.userId});

  @override
  State<UpdatePwdScreen> createState() => _UpdatePwdScreenState();
}

class _UpdatePwdScreenState extends State<UpdatePwdScreen> {
  bool _isVisible = true;
  late TextEditingController _pwdController;
  late TextEditingController _oldPwdController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _pwdController = TextEditingController();
    _oldPwdController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryClair,
        elevation: 0,
        title: const Text(
          "Modify the profile",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (BuildContext context, UserState state) {
          if (state.errorSavingPwdModification) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message.toString(),
                ),
              ),
            );
          }
          if (state.successSavingPwdModification) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'your new password has been successfully saved',
                ),
              ),
            );
            context.router.push(const SettingsRoute());
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    InputWidget(
                      controller: _oldPwdController,
                      keyboardType: TextInputType.visiblePassword,
                      contentPadding: const EdgeInsets.only(left: 10),
                      label: 'Old Password',
                      prefixIcon: const Icon(Icons.lock),
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
                      controller: _pwdController,
                      keyboardType: TextInputType.visiblePassword,
                      label: 'New Password',
                      prefixIcon: const Icon(Icons.lock),
                      contentPadding: const EdgeInsets.only(left: 10),
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
                      height: 100,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            getIt.get<UserCubit>().updatePassword(
                                  oldPassword: _oldPwdController.text,
                                  password: _pwdController.text,
                                  userId: widget.userId,
                                );
                            getIt.get<AuthCubit>().getUser();
                          },
                          child: ButtonWidget(
                            borderColor: AppColors.secondary,
                            bgColor: AppColors.white,
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            fontSize: 17,
                            text: 'Save Password',
                            textColor: AppColors.secondary,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (state.isSavingPwdModification)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
