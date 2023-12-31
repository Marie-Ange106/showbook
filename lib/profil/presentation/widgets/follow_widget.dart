import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/account/business_logic/cubit/user_cubit.dart';

import '../../../auth/data/user_model.dart';
import '../../business_logic/cubit/profil_cubit.dart';
import '../../data/models/profil_model.dart';
import '../../../service_locator.dart';
import '../../../shared/utils/app_colors.dart';
import '../../../shared/widgets/button_widget.dart';

class FollowWidget extends StatelessWidget {
  const FollowWidget({
    super.key,
    required this.profilModel,
    required this.user,
  });

  final ProfilModel profilModel;
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilCubit, ProfilState>(
      builder: (context, state) {
        return GestureDetector( 
          onTap: () {
            if (user != null) {
              if (profilModel.isFollowBy(
                userId: user!.id,
              )) {
                profilModel.removeFollow(
                    profilId: profilModel.id, uId: user!.id);
                getIt.get<ProfilCubit>().follow(profilId: profilModel.id);
                getIt.get<UserCubit>().removeProfil(profilModel);
              } else {
                profilModel.addFollow(user: user!);
                getIt.get<ProfilCubit>().follow(profilId: profilModel.id);
                getIt.get<UserCubit>().addProfilFollowed(profilModel);
              }
            }
          },
          child: user != null
              ? profilModel.isFollowBy(userId: user!.id) == false
                  ? const ButtonWidget(
                      borderColor: AppColors.primary,
                      bgColor: AppColors.primary,
                      text: 'Follow',
                      textColor: AppColors.white,
                      height: 34,
                      fontSize: 14,
                    )
                  : const ButtonWidget(
                      borderColor: AppColors.secondary,
                      bgColor: AppColors.secondary,
                      text: 'UnFollow',
                      textColor: AppColors.white,
                      height: 34,
                      fontSize: 14,
                    )
              : const ButtonWidget(
                  borderColor: AppColors.primary,
                  bgColor: AppColors.primary,
                  text: 'Follow',
                  textColor: AppColors.white,
                  height: 34,
                  fontSize: 14,
                ),
        );
      },
    );
  }
}
