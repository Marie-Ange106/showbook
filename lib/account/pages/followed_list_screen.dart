import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/account/business_logic/cubit/user_cubit.dart';
import 'package:showbook/profil/data/models/profil_model.dart';
import 'package:showbook/profil/presentation/widgets/profil_item_widget.dart';
import 'package:showbook/shared/routes/routes.gr.dart';

@RoutePage()
class FollowedListScreen extends StatefulWidget {
  static int totalProfil = 0;
  const FollowedListScreen({super.key});

  @override
  State<FollowedListScreen> createState() => FollowedListScreenState();
}

class FollowedListScreenState extends State<FollowedListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.profilFollow.length,
            itemBuilder: (context, index) {
              // if (state.profilFollow.isEmpty) {
              //   return Text('Aucun profil suivi!');
              // }
              ProfilModel profil = state.profilFollow[index];
              // FollowedListScreen.totalProfil = state.profilFollow.length;
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: GestureDetector(
                  onTap: () {
                    context.router.push(
                      DetailProfilRoute(profil: profil),
                    );
                  },
                  child: ProfilWidget(profilModel: profil),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
