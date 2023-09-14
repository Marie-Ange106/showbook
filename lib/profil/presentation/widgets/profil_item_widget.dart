import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/auth/data/user_model.dart';
import 'package:showbook/profil/business_logic/cubit/profil_cubit.dart';

import '../../../auth/business_logic/cubit/auth_cubit.dart';
import '../../../service_locator.dart';
import '../../../shared/utils/app_colors.dart';
import '../../../shared/widgets/button_widget.dart';
import '../../../shared/widgets/follow_widget.dart';
import '../../data/models/profil_model.dart';

class ProfilWidget extends StatelessWidget {
  const ProfilWidget({
    super.key,
    required this.profilModel,
  });

  final ProfilModel profilModel;

  @override
  Widget build(BuildContext context) {
    var user = getIt.get<AuthCubit>().state.user!;
    return SizedBox(
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              // color: Colors.amber,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                'http://192.168.100.140:8000/storage/${profilModel.imagePath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'type',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            profilModel.name,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${profilModel.follower.toString()} Followers',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    FollowWidget(profilModel: profilModel, user: user),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

