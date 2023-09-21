import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/account/business_logic/cubit/user_cubit.dart';
import 'package:showbook/auth/business_logic/cubit/auth_cubit.dart';
import 'package:showbook/service_locator.dart';
import 'package:showbook/shared/routes/routes.gr.dart';

import '../../auth/data/user_model.dart';
import '../../shared/utils/app_colors.dart';
import '../../shared/widgets/button_widget.dart';
import '../../shared/widgets/input_widget.dart';

@RoutePage()
class UserInfoScreen extends StatefulWidget {
  final UserModel user;
  const UserInfoScreen({super.key, required this.user});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _nameController = TextEditingController();
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
          if (state.errorSavingNameEmailModification) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message.toString(),
                ),
              ),
            );
          }
          if (state.successSavingNameEmailModification) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'your informations has been successfully saved',
                ),
              ),
            );
            getIt.get<AuthCubit>().getUser();
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
                      controller: _nameController..text = widget.user.name,
                      contentPadding: const EdgeInsets.only(left: 10),
                      keyboardType: TextInputType.name,
                      label: 'Name',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputWidget(
                      controller: _emailController..text = widget.user.email,
                      contentPadding: const EdgeInsets.only(left: 10),
                      keyboardType: TextInputType.emailAddress,
                      label: 'Email',
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            getIt.get<UserCubit>().updateNameAndEmail(
                                  email: _emailController.text,
                                  name: _nameController.text,
                                  userId: widget.user.id,
                                );
                          },
                          child: ButtonWidget(
                            borderColor: AppColors.secondary,
                            bgColor: AppColors.white,
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            fontSize: 17,
                            text: 'Save modification',
                            textColor: AppColors.secondary,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (state.isSavingNameEmailModification)
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
