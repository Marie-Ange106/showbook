import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/shared/routes/routes.gr.dart';

import '../../service_locator.dart';
import '../../shared/utils/app_colors.dart';
import '../../shared/widgets/button_widget.dart';
import '../../shared/widgets/input_widget.dart';
import '../business_logic/cubit/user_cubit.dart';

@RoutePage()
class DeleteAccountScreen extends StatefulWidget {
  final int userId;
  const DeleteAccountScreen({super.key, required this.userId});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  bool _isVisible = true;
  late TextEditingController _pwdController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _pwdController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryClair,
        elevation: 0,
        title: const Row(
          children: [
            Text(
              "Delete account",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.delete,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (BuildContext context, UserState state) {
          if (state.errorDeletingAccount) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message.toString(),
                ),
              ),
            );
          }
          if (state.sucessDeletingAccount) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'your account has been successfully deleted!',
                ),
              ),
            );
            context.router.pushAndPopUntil(
              const ApplicationRoute(),
              predicate: (_) => false,
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Text(
                    'To delete your account, please confirm your password',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        InputWidget(
                          controller: _pwdController,
                          keyboardType: TextInputType.visiblePassword,
                          label: 'Password',
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
                                getIt.get<UserCubit>().deleteUser(
                                      password: _pwdController.text,
                                      userId: widget.userId,
                                    );
                              },
                              child: ButtonWidget(
                                borderColor: AppColors.primary,
                                bgColor: AppColors.primary,
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                fontSize: 17,
                                text: 'Delete my account',
                                textColor: AppColors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            if (state.isDeletingAccount)
                              const Center(
                                child: CircularProgressIndicator(),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
